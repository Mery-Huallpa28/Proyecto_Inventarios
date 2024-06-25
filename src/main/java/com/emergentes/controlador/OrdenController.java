package com.emergentes.controlador;

import com.emergentes.dao.OrdenDAO;
import com.emergentes.dao.OrdenDAOimpl;
import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.modelo.Orden;
import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "OrdenController", urlPatterns = {"/OrdenController"})
public class OrdenController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id;
            Orden orden = new Orden();
            OrdenDAO dao = new OrdenDAOimpl();
           ProductoDAO daoProducto = new ProductoDAOimpl();
            List<Producto> lista_productos = null;

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    lista_productos = daoProducto.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("orden", orden);
                    request.getRequestDispatcher("frmorden.jsp").forward(request, response);

                    break;

                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    orden = dao.getById(id);
                    lista_productos = daoProducto.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("orden", orden);
                    request.getRequestDispatcher("frmorden.jsp").forward(request, response);

                    break;
                case "delete":

                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("OrdenController");
                    break;
                case "view":
                    List<Orden> lista = dao.getAll();
                    request.setAttribute("ordenes", lista);
                    request.getRequestDispatcher("orden.jsp").forward(request, response);
                    break;
            }

        } catch (Exception ex) {
            System.out.println("Error" + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            String productoIdStr = request.getParameter("producto_id");
            String cantidadStr = request.getParameter("cantidad");
            String fecha = request.getParameter("fecha");

            int id = (idStr != null && !idStr.isEmpty()) ? Integer.parseInt(idStr) : 0;
            int producto_id = (productoIdStr != null && !productoIdStr.isEmpty()) ? Integer.parseInt(productoIdStr) : 0;
            int cantidad = (cantidadStr != null && !cantidadStr.isEmpty()) ? Integer.parseInt(cantidadStr) : 0;

            Orden or = new Orden();
            or.setId(id);
            or.setProducto_id(producto_id);
            or.setCantidad(cantidad);
            or.setFecha(fecha);

            OrdenDAO dao = new OrdenDAOimpl();
            if (id == 0) {
                try {
                    dao.insert(or);
                    response.sendRedirect("OrdenController");
                } catch (Exception ex) {
                    Logger.getLogger(ProductoController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    dao.update(or);
                    response.sendRedirect("OrdenController");
                } catch (Exception ex) {
                    Logger.getLogger(ProductoController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (NumberFormatException ex) {
            Logger.getLogger(OrdenController.class.getName()).log(Level.SEVERE, "Error de formato numérico", ex);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de número incorrecto");
        } catch (Exception ex) {
            Logger.getLogger(OrdenController.class.getName()).log(Level.SEVERE, "Error en doPost", ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error en el servidor");
        }
    }
}
