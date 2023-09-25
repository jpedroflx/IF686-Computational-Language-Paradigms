import java.util.List;

class MembroEquipe {
    private String nome;

    public MembroEquipe(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

class LiderEquipe extends MembroEquipe {
    public LiderEquipe(String nome) {
        super(nome);
    }
}

class Tarefa<T> {
    private String descricao;
    private T responsavel;

    public Tarefa(String descricao, T responsavel) {
        this.descricao = descricao;
        this.responsavel = responsavel;
    }

    public T getResponsavel() {
        return responsavel;
    }
}

public class Main {
    public static void main(String[] args) {
        MembroEquipe membro1 = new MembroEquipe("João");
        MembroEquipe membro2 = new MembroEquipe("Maria");

        LiderEquipe lider1 = new LiderEquipe("Pedro");

        Tarefa<MembroEquipe> tarefa1 = new Tarefa<>("Desenvolvimento de código", membro1);
        Tarefa<MembroEquipe> tarefa2 = new Tarefa<>("Correção de bugs", membro2);
        Tarefa<LiderEquipe> tarefa3 = new Tarefa<>("Revisão de código", lider1);

        List<Tarefa<MembroEquipe>> tarefas = List.of(tarefa1, tarefa2, tarefa3);

        double cargaJoao = calcularCargaDeTrabalho(tarefas, membro1);
        double cargaMaria = calcularCargaDeTrabalho(tarefas, membro2);
        double cargaPedro = calcularCargaDeTrabalho(tarefas, lider1);

        System.out.println("Carga de trabalho do João: " + cargaJoao + " tarefa(s).");
        System.out.println("Carga de trabalho da Maria: " + cargaMaria + " tarefa(s).");
        System.out.println("Carga de trabalho do Pedro: " + cargaPedro + " tarefa(s).");
    }

    public static <T> double calcularCargaDeTrabalho(List<Tarefa<T>> tarefas, T membro) {
        int carga = 0;
        for (Tarefa<T> tarefa : tarefas) {
            if (tarefa.getResponsavel().equals(membro)) {
                carga++;
            }
        }
        return carga;
    }
}
