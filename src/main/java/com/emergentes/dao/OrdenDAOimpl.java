
package com.emergentes.dao;

import com.emergentes.modelo.Orden;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrdenDAOimpl extends ConexionDB implements OrdenDAO{

    @Override
    public void insert(Orden orden) throws Exception {
         try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO ordenes ( producto_id, cantidad, fecha) values(?, ?, ?)");
            ps.setInt(1, orden.getProducto_id());
            ps.setInt(2, orden.getCantidad());
            ps.setString(3, orden.getFecha());
           

            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
      }

    @Override
    public void update(Orden orden) throws Exception {
        
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE ordenes SET producto_id = ?, cantidad = ?, fecha = ? WHERE id = ?");
            ps.setInt(1, orden.getProducto_id());
            ps.setInt(2, orden.getCantidad());
            ps.setString(3, orden.getFecha());
           ps.setInt(4, orden.getId());

            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        
     }

    @Override
    public void delete(int id) throws Exception {
         try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM ordenes WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
     }

    @Override
    public Orden getById(int id) throws Exception {
        Orden or = new Orden();
         try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM ordenes WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                or.setId(rs.getInt("id"));
                or.setProducto_id(rs.getInt("producto_id"));
                or.setCantidad(rs.getInt("cantidad"));
                or.setFecha(rs.getString("fecha"));
               

            }

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return or;

    }

    @Override
    public List<Orden> getAll() throws Exception {
         List<Orden> lista = null;
        try {
            this.conectar();

            PreparedStatement ps = this.conn.prepareStatement("SELECT o. *, p.nombre as producto FROM ordenes o \n" +
"                     LEFT JOIN productos p ON o.producto_id=p.id");
            ResultSet rs = ps.executeQuery();

            lista = new ArrayList<Orden>();

            while (rs.next()) {
                Orden or = new Orden();
                or.setId(rs.getInt("id"));
                or.setProducto_id(rs.getInt("producto_id"));
                 or.setCantidad(rs.getInt("cantidad"));
                or.setFecha(rs.getString("fecha"));
                or.setProducto(rs.getString("producto"));
                lista.add(or);
            }
            rs.close();
            ps.close();

        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
     }
    
}
