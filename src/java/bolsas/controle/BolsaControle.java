package bolsas.controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bolsas.modelo.Bolsa;
import bolsas.modelo.TipoMaterial;
import bolsas.repositorio.BolsaRepositorio;

@WebServlet(name = "BolsaControle", urlPatterns = {"/salvar", "/excluir", "/nova", "/editar", "/consultar", "/listar"})
public class BolsaControle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        if (path.endsWith("/salvar")) {
            String sCodigo = request.getParameter("codigo");
            Integer codigo = null;
            if (sCodigo != null && !sCodigo.trim().isEmpty()) {
                codigo = Integer.valueOf(sCodigo);
            }
            String marca = request.getParameter("marca");
            String tamanho = request.getParameter("tamanho");
            String cor = request.getParameter("cor");
            String tiposBolsa = request.getParameter("tiposBolsa");
            TipoMaterial material = TipoMaterial.valueOf(request.getParameter("material"));

            Bolsa bolsa = new Bolsa();
            bolsa.setCodigo(codigo);
            bolsa.setMarca(marca);
            bolsa.setCor(cor);
            bolsa.setTamanho(tamanho);
            bolsa.setTiposBolsa(tiposBolsa);
            bolsa.setMaterial(material);

            BolsaRepositorio.getInstance().salvar(bolsa);

            response.sendRedirect("listar");
        } else if (path.endsWith("/excluir")) {
            Integer codigo = Integer.valueOf(request.getParameter("codigo"));
            BolsaRepositorio.getInstance().excluir(codigo);
            response.sendRedirect("listar");
        } else if (path.endsWith("/nova")) {
            request.getRequestDispatcher("gerenciar.jsp")
                    .forward(request, response);
        } else if (path.endsWith("/editar")) {
            Integer codigo = Integer.valueOf(request.getParameter("codigo"));
            Bolsa bolsa = BolsaRepositorio.getInstance()
                    .getBolsa(codigo);
            request.setAttribute("bolsa", bolsa);
            request.getRequestDispatcher("gerenciar.jsp")
                    .forward(request, response);
        } else if (path.endsWith("/consultar")) {
            Integer codigo = Integer.valueOf(request.getParameter("codigo"));
            Bolsa bolsa = BolsaRepositorio.getInstance()
                    .getBolsa(codigo);
            request.setAttribute("bolsa", bolsa);
            request.getRequestDispatcher("consultar.jsp")
                    .forward(request, response);
        } else if (path.endsWith("/listar")) {
            String marca = request.getParameter("marca");
            if (marca != null) {
                marca = marca.trim();
            }
            String sMaterial = request.getParameter("material");
            TipoMaterial material = null;
            if (sMaterial != null) {
                material = TipoMaterial.valueOf(sMaterial);
            }

            List<Bolsa> bolsas = BolsaRepositorio.getInstance()
                    .getBolsas(marca, material);
            request.setAttribute("lista", bolsas);
            request.getRequestDispatcher("registro.jsp")
                    .forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
