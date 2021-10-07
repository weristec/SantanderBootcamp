package dio.awrsmod.des.operacao.interno;

import dio.awrsmod.des.operacao.Operacao;

public class MultHelper implements Operacao {
    @Override
    public int execute(int a, int b) {
        return a * b;
    }
}
