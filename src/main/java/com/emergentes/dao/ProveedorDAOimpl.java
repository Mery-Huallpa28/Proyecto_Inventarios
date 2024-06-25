
package com.emergentes.dao;

import com.emergentes.modelo.Proveedor;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDAOimpl extends ConexionDB implements ProveedorDAO{

    @Override
    public void insert(Proveedor proveedor) throws Exception {
       
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO proveedores ( nombre, telefono, email, producto_id) values(?, ?, ?, ?)");
            ps.setString(1, proveedor.getNombre());
            ps.setInt(2, proveedor.getTelefono());
            ps.setString(3, proveedor.getEmail());
            ps.setInt(4, proveedor.getProducto_id());

            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Proveedor proveedor) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE proveedores  SET nombre = ?, telefono = ?, email = ?, producto_id=?  WHERE id = ? ");
            ps.setString(1, proveedor.getNombre());
            ps.setInt(2, proveedor.getTelefono());
            ps.setString(3, proveedor.getEmail());
            ps.setInt(4, proveedor.getProducto_id());
            ps.setInt(5, proveedor.getId());
            
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
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM proveedores WHERE id = ? ");

            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Proveedor getById(int id) throws Exception {
        Proveedor pro = new Proveedor();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM proveedores WHERE id = ? ");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nombre"));
                pro.setTelefono(rs.getInt("telefono"));
                pro.setEmail(rs.getString("email"));
                pro.setProducto_id(rs.getInt("producto_id"));
                

            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return pro;
    }

    @Override
    public List<Proveedor> getAll() throws Exception {
        List<Proveedor> lista = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT pr. *, p.nombre as producto FROM proveedores pr\n" +
"                    LEFT JOIN productos p ON pr.producto_id=p.id ");

            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Proveedor>();
            while (rs.next()) {
                Proveedor pro = new Proveedor();
                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nombre"));
                pro.setTelefono(rs.getInt("telefono"));
                pro.setEmail(rs.getString("email"));
                pro.setProducto_id(rs.getInt("producto_id"));
                pro.setProducto(rs.getString("producto"));

                lista.add(pro);
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
