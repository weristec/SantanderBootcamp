package dio.awrs.des.operacao.interno;

import dio.awrs.des.operacao.Operacao;

public class SumHelper implements Operacao {
    @Override
    public int execute(int a, int b) {
        return a + b;
    }
}
