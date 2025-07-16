package com.example.vacunas.controller;

import com.example.vacunas.dao.UsuarioDAO;
import com.example.vacunas.model.Usuario;
import com.example.vacunas.utils.PasswordUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "RegisterController", value = "/RegisterController")
public class RegisterController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cedula = request.getParameter("cedula");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        Date fechaNacimiento = Date.valueOf(request.getParameter("fecha_nacimiento"));
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Las contraseñas no coinciden");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        String hashedPassword = PasswordUtils.encriptarPassword(password);

        Usuario usuario = new Usuario();
        usuario.setCedula(cedula);
        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setEmail(email);
        usuario.setFechaNacimiento(fechaNacimiento);
        usuario.setPassword(hashedPassword);
        usuario.setRol("USER");

        UsuarioDAO usuarioDAO = new UsuarioDAO();

        try {
            if (usuarioDAO.cedulaExiste(cedula)) {
                request.setAttribute("error", "La cédula ya está registrada");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            if (usuarioDAO.emailExiste(email)) {
                request.setAttribute("error", "El email ya está registrado");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            usuarioDAO.crear(usuario);
            request.setAttribute("success", "Registro exitoso. Ahora puede iniciar sesión.");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error en el registro. Intente más tarde.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}