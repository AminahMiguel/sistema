package bolsas.modelo;

public class Bolsa {

    private Integer codigo;
    private String marca;
    private String cor;
    private String tamanho;
    private String tiposBolsa;
    private TipoMaterial material;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public String getTiposBolsa() {
        return tiposBolsa;
    }

    public void setTiposBolsa(String tiposBolsa) {
        this.tiposBolsa = tiposBolsa;
    }

    public TipoMaterial getMaterial() {
        return material;
    }

    public void setMaterial(TipoMaterial material) {
        this.material = material;
    }

}
