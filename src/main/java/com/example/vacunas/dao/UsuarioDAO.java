package com.example.vacunas.dao;

import com.example.vacunas.model.Usuario;
import com.example.vacunas.utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {
    public Usuario obtenerPorCedula(String cedula) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE cedula = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, cedula);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return mapearUsuario(rs);
            }
        }
        return null;
    }

    public boolean cedulaExiste(String cedula) throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE cedula = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, cedula);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }

    public boolean emailExiste(String email) throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE email = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }

    public void crear(Usuario usuario) throws SQLException {
        if (usuario.getRol() == null ||
                (!usuario.getRol().equals("DOCTOR") && !usuario.getRol().equals("USER"))) {
            throw new SQLException("Rol de usuario no válido: " + usuario.getRol());
        }

        String sql = "INSERT INTO usuarios (cedula, password, nombre, email, rol) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, usuario.getCedula());
            stmt.setString(2, usuario.getPassword());
            stmt.setString(3, usuario.getNombre());
            stmt.setString(4, usuario.getEmail() != null ? usuario.getEmail() : null);
            stmt.setString(5, usuario.getRol());

            stmt.executeUpdate();

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    usuario.setId(generatedKeys.getInt(1));
                }else {
                    throw new SQLException("La creación del usuario falló, no se obtuvo ID.");
                }
            }
        }catch (SQLException e) {
            System.err.println("[ERROR] SQLException al crear usuario: " + e.getMessage());
            System.err.println("SQLState: " + e.getSQLState());
            System.err.println("VendorError: " + e.getErrorCode());
            throw e;
        }
    }

    public void incrementarIntentosFallidos(int usuarioId) throws SQLException {
        String sql = "UPDATE usuarios SET intentos_fallidos = intentos_fallidos + 1 WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);
            stmt.executeUpdate();
        }
    }

    public void reiniciarIntentosFallidos(int usuarioId) throws SQLException {
        String sql = "UPDATE usuarios SET intentos_fallidos = 0 WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);
            stmt.executeUpdate();
        }
    }

    public void bloquearUsuario(int usuarioId) throws SQLException {
        String sql = "UPDATE usuarios SET bloqueado = TRUE WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);
            stmt.executeUpdate();
        }
    }

    private Usuario mapearUsuario(ResultSet rs) throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setId(rs.getInt("id"));
        usuario.setCedula(rs.getString("cedula"));
        usuario.setPassword(rs.getString("password"));
        usuario.setNombre(rs.getString("nombre"));
        usuario.setApellido(rs.getString("apellido"));
        usuario.setEmail(rs.getString("email"));
        usuario.setTelefono(rs.getString("telefono"));
        usuario.setDireccion(rs.getString("direccion"));
        usuario.setIntentosFallidos(rs.getInt("intentos_fallidos"));
        usuario.setBloqueado(rs.getBoolean("bloqueado"));
        usuario.setFechaRegistro(rs.getTimestamp("fecha_registro"));
        usuario.setRol(rs.getString("rol"));
        return usuario;
    }
}