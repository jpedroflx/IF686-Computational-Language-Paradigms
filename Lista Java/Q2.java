/*
    Classes Concretas:

    Quando usar: Classes concretas são apropriadas quando você tem tipos de veículos específicos com implementações concretas, e essas implementações são suficientemente diferentes entre si.

    Justificação: Por exemplo, se você tem tipos de veículos como "Carro", "Moto" e "Bicicleta", e cada um deles possui características e comportamentos muito distintos que não podem ser generalizados, então faz sentido ter classes concretas para cada um desses tipos de veículos. Isso permite que você implemente os detalhes específicos de cada veículo nas respectivas classes, sem a necessidade de herança ou interfaces.
*/

class Carro {
    // Implementação específica para carros
}

class Moto {
    // Implementação específica para motos
}

class Bicicleta {
    // Implementação específica para bicicletas
}

/*
    Classes Abstratas:

    Quando usar: Classes abstratas são úteis quando existe alguma semelhança significativa entre os tipos de veículos, mas ainda existem diferenças que precisam ser tratadas nas subclasses. Isso permite que você forneça implementações padrão para alguns métodos e, ao mesmo tempo, exija que as subclasses forneçam implementações específicas.

    Justificação: Por exemplo, se todos os veículos têm um método comum chamado "alugar", mas a implementação varia entre carros, motos e bicicletas, você pode criar uma classe abstrata para fornecer uma implementação padrão do método "alugar" e, em seguida, as subclasses podem sobrescrevê-lo conforme necessário.
*/

abstract class Veiculo {
    // Implementação comum para métodos compartilhados entre veículos

    abstract void alugar();
}

class Carro extends Veiculo {
    @Override
    void alugar() {
        // Implementação específica para carros
    }
}

class Moto extends Veiculo {
    @Override
    void alugar() {
        // Implementação específica para motos
    }
}

class Bicicleta extends Veiculo {
    @Override
    void alugar() {
        // Implementação específica para bicicletas
    }
}

/*
    Interfaces:

    Quando usar: Interfaces são apropriadas quando você deseja definir um conjunto de métodos que todas as classes de veículos devem implementar, independentemente das semelhanças ou diferenças entre eles.

    Justificação: Se houver um conjunto de comportamentos comuns que você deseja garantir que todas as classes de veículos implementem (por exemplo, métodos como "alugar", "devolver" e "verificarDisponibilidade"), você pode criar uma interface para isso. As classes de veículos então implementariam essa interface, garantindo que elas tenham os métodos necessários, mas cada uma delas ainda pode fornecer sua própria implementação específica.
*/

interface VeiculoAlugavel {
    void alugar();
    void devolver();
    boolean verificarDisponibilidade();
}

class Carro implements VeiculoAlugavel {
    @Override
    public void alugar() {
        // Implementação específica para carros
    }

    @Override
    public void devolver() {
        // Implementação específica para carros
    }

    @Override
    public boolean verificarDisponibilidade() {
        // Implementação específica para carros
    }
}

class Moto implements VeiculoAlugavel {
    @Override
    public void alugar() {
        // Implementação específica para motos
    }

    @Override
    public void devolver() {
        // Implementação específica para motos
    }

    @Override
    public boolean verificarDisponibilidade() {
        // Implementação específica para motos
    }
}

class Bicicleta implements VeiculoAlugavel {
    @Override
    public void alugar() {
        // Implementação específica para bicicletas
    }

    @Override
    public void devolver() {
        // Implementação específica para bicicletas
    }

    @Override
    public boolean verificarDisponibilidade() {
        // Implementação específica para bicicletas
    }
}

/*
    Em resumo, a escolha entre classes concretas, classes abstratas e interfaces depende da complexidade das semelhanças e diferenças entre os tipos de veículos e dos requisitos específicos do sistema. Cada abordagem tem suas vantagens e desvantagens, e a decisão deve ser tomada com base nas necessidades de design do seu sistema.
 */
