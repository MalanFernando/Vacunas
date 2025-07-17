package com.example.vacunas.controller;

import com.example.vacunas.dao.UsuarioDAO;
import com.example.vacunas.model.Usuario;
import com.example.vacunas.utils.PasswordUtils;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginController", value = "/LoginController")
public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cedula = request.getParameter("cedula");
        String password = request.getParameter("password");

        UsuarioDAO usuarioDAO = new UsuarioDAO();

        try {
            Usuario usuario = usuarioDAO.obtenerPorCedula(cedula);

            if (usuario == null) {
                request.setAttribute("error", "Usuario no encontrado");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }

            if (usuario.isBloqueado()) {
                request.setAttribute("error", "Cuenta bloqueada. Contacte al administrador.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
            if (BCrypt.checkpw(password, usuario.getPassword())) {
//            if (PasswordUtils.verificarPassword(password, usuario.getPassword())) {
                // Login exitoso
                usuarioDAO.reiniciarIntentosFallidos(usuario.getId());

                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);

                switch (usuario.getRol()) {
                    case "ADMIN":
                        response.sendRedirect("admin/dashboard.jsp");
                        break;
                    case "DOCTOR":
                        response.sendRedirect("doctor/dashboard.jsp");
                        break;
                    case "USER":
                        response.sendRedirect("user/dashboard.jsp");
                        break;
                }
            } else {
                // Login fallido
                usuarioDAO.incrementarIntentosFallidos(usuario.getId());
                int intentosRestantes = 3 - usuario.getIntentosFallidos() - 1;

                if (intentosRestantes <= 0) {
                    usuarioDAO.bloquearUsuario(usuario.getId());
                    request.setAttribute("error", "Cuenta bloqueada por múltiples intentos fallidos.");
                } else {
                    request.setAttribute("error", "Contraseña incorrecta. Te quedan " + intentosRestantes + " intentos.");
                }

                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error en el sistema. Intente más tarde.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}