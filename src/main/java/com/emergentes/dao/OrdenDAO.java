
package com.emergentes.dao;

import com.emergentes.modelo.Orden;
import java.util.List;

public interface OrdenDAO {
    public void insert(Orden orden) throws Exception;
    public void update(Orden orden) throws Exception;
    public void delete (int id) throws Exception;
    public Orden getById(int id) throws Exception;
    public List<Orden> getAll()throws Exception; 
}
