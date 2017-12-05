package bolsas.repositorio;

import bolsas.modelo.TipoMaterial;
import bolsas.modelo.Bolsa;
import com.sun.prism.PresentableState;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BolsaRepositorio {
    
    private static final BolsaRepositorio INSTANCE = new BolsaRepositorio();

    public static BolsaRepositorio getInstance() {
        return INSTANCE;
    }
    
    private BolsaRepositorio() {}
    
    public void salvar(Bolsa bolsa) {
        if(bolsa.getCodigo() == null) {
            inserir(bolsa);
        } else {
            atualizar(bolsa);
        }
    }
    
    public void inserir(Bolsa bolsa) {
        try(Connection c = ConexaoUtil.getConnection()) {
            String sql = "insert into bolsa "
                    + "(codigo,marca,cor,tamanho,tiposBolsa,material) "
                    + "values ((select coalesce(max(codigo), 0) + 1 from bolsa),"
                    + "?,?,?,?,?)";
            
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, bolsa.getMarca());
            ps.setString(2, bolsa.getCor());
            ps.setString(3, bolsa.getTamanho());
            ps.setString(4, bolsa.getTiposBolsa());
            ps.setString(5, bolsa.getMaterial().name());            
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void atualizar(Bolsa bolsa) {
        try(Connection c = ConexaoUtil.getConnection()) {
            String sql = "update bolsa set "
                    + "marca=?,cor=?,"
                    + "tamanho=?,tiposBolsa=?,material=? "
                    + " where codigo=?";
            
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, bolsa.getMarca());
            ps.setString(2, bolsa.getCor());
            ps.setString(3, bolsa.getTamanho());
            ps.setString(4, bolsa.getTiposBolsa());
            ps.setString(5, bolsa.getMaterial().name());            
            ps.setInt(6, bolsa.getCodigo());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void excluir(Integer codigo) {
        try(Connection c = ConexaoUtil.getConnection()) {
            String sql = "delete from bolsa where codigo=?";
            
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, codigo);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Bolsa getBolsa(Integer codigo) {
        try(Connection c = ConexaoUtil.getConnection()) {
            String sql = "select marca,cor,"
                    + " tamanho,tiposBolsa,material "
                    + " from bolsa where codigo=?";
            
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, codigo);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                Bolsa bolsa = new Bolsa();
                bolsa.setCodigo(codigo);
                bolsa.setMarca(rs.getString("marca"));
                bolsa.setCor(rs.getString("cor"));
                bolsa.setTamanho(rs.getString("tamanho"));
                bolsa.setTiposBolsa(rs.getString("tiposBolsa"));
                bolsa.setMaterial(TipoMaterial.valueOf(rs.getString("material")));
                return bolsa;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Bolsa> getBolsas(String marca, TipoMaterial material) {
        List<Bolsa> lista = new ArrayList<>();
        try(Connection c = ConexaoUtil.getConnection()) {
            String sql = "select codigo,marca,cor,"
                    + " tamanho,tiposBolsa,material "
                    + " from bolsa where 1=1 ";
            
            if(marca != null) {
                sql += " AND marca like ?";
            }
            
            if(material != null) {
                sql += " AND material = ?";
            }
            
            PreparedStatement ps = c.prepareStatement(sql);
            int i = 1;
            if(marca != null) {
                ps.setString(i, "%" + marca + "%");
                i++;
            }
            
            if(material != null) {
                ps.setString(i, material.name());
            }
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Bolsa bolsa = new Bolsa();
                bolsa.setCodigo(rs.getInt("codigo"));
                bolsa.setMarca(rs.getString("marca"));
                bolsa.setCor(rs.getString("cor"));
                bolsa.setTamanho(rs.getString("tamanho"));
                bolsa.setTiposBolsa(rs.getString("tiposBolsa"));
                bolsa.setMaterial(TipoMaterial.valueOf(rs.getString("material")));
                lista.add(bolsa);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return lista;
    }
}
