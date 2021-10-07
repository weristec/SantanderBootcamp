package dio.awrs.des.operacao;

import dio.awrs.des.operacao.interno.DivHelper;
import dio.awrs.des.operacao.interno.MultHelper;
import dio.awrs.des.operacao.interno.SubHelper;
import dio.awrs.des.operacao.interno.SumHelper;

public class Calculadora {
    private SumHelper sunHelper;
    private SubHelper subHelper;
    private MultHelper multHelper;
    private DivHelper divHelper;

    public Calculadora(){
        sunHelper = new SumHelper();
        subHelper = new SubHelper();
        multHelper = new MultHelper();
        divHelper = new DivHelper();
    }
    public int sum(int a, int b){
        return  sunHelper.execute(a,b);
    }
    public int sub(int a, int b){
        return  subHelper.execute(a,b);
    }
    public int mult(int a, int b){
        return  multHelper.execute(a,b);
    }
    public int div(int a, int b){
        return  divHelper.execute(a,b);
    }
}
