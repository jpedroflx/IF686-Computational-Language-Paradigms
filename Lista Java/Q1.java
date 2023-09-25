import java.util.Scanner;

// Interface FormaDePagamento
interface FormaDePagamento {
    boolean autenticar();
    void processarPagamento(double valor);
}

// Classe CartaoCredito
class CartaoCredito implements FormaDePagamento {
    private String senha;
    private String codigoSeguranca;

    public CartaoCredito(String senha, String codigoSeguranca) {
        this.senha = senha;
        this.codigoSeguranca = codigoSeguranca;
    }

    @Override
    public boolean autenticar() {
        // Simule a autenticação com o cartão de crédito verificando senha e código de segurança
        return senha.equals("senhaCartao") && codigoSeguranca.equals("123");
    }

    @Override
    public void processarPagamento(double valor) {
        if (autenticar()) {
            System.out.println("Pagamento com cartão de crédito no valor de " + valor + " processado com sucesso");
        } else {
            throw new RuntimeException("Pagamento não autorizado");
        }
    }
}

// Classe BoletoBancario
class BoletoBancario implements FormaDePagamento {
    private String codigoBoleto;

    public BoletoBancario(String codigoBoleto) {
        this.codigoBoleto = codigoBoleto;
    }

    @Override
    public boolean autenticar() {
        // Simule a autenticação com o boleto bancário verificando o código do boleto
        return codigoBoleto.equals("123456");
    }

    @Override
    public void processarPagamento(double valor) {
        if (autenticar()) {
            System.out.println("Pagamento com boleto bancário no valor de " + valor + " processado com sucesso");
        } else {
            throw new RuntimeException("Pagamento não autorizado");
        }
    }
}

// Classe PayPal
class PayPal implements FormaDePagamento {
    private String login;
    private String senha;

    public PayPal(String login, String senha) {
        this.login = login;
        this.senha = senha;
    }

    @Override
    public boolean autenticar() {
        // Simule a autenticação com o PayPal verificando login e senha
        return login.equals("paypal_user") && senha.equals("senhaPayPal123");
    }

    @Override
    public void processarPagamento(double valor) {
        if (autenticar()) {
            System.out.println("Pagamento com PayPal no valor de " + valor + " processado com sucesso");
        } else {
            throw new RuntimeException("Pagamento não autorizado");
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Escolha o método de pagamento desejado:");
        System.out.println("1 - Cartão de Crédito");
        System.out.println("2 - Boleto Bancário");
        System.out.println("3 - PayPal");

        int escolha = scanner.nextInt();
        scanner.nextLine(); // Limpa o buffer de entrada

        FormaDePagamento formaDePagamento = null;

        switch (escolha) {
            case 1:
                System.out.print("Digite a senha do cartão: ");
                String senhaCartao = scanner.nextLine();
                System.out.print("Digite o código de segurança: ");
                String codigoSeguranca = scanner.nextLine();
                formaDePagamento = new CartaoCredito(senhaCartao, codigoSeguranca);
                break;
            case 2:
                System.out.print("Digite o código do boleto: ");
                String codigoBoleto = scanner.nextLine();
                formaDePagamento = new BoletoBancario(codigoBoleto);
                break;
            case 3:
                System.out.print("Digite o login do PayPal: ");
                String loginPayPal = scanner.nextLine();
                System.out.print("Digite a senha do PayPal: ");
                String senhaPayPal = scanner.nextLine();
                formaDePagamento = new PayPal(loginPayPal, senhaPayPal);
                break;
            default:
                System.out.println("Opção inválida");
                System.exit(1);
        }

        System.out.print("Digite o valor do pagamento: ");
        double valorPagamento = scanner.nextDouble();

        try {
            formaDePagamento.processarPagamento(valorPagamento);
        } catch (RuntimeException e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}
