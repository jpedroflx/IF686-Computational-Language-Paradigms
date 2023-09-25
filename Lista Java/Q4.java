// Classe abstrata Coffee
abstract class Coffee {
    private String name;
    private double waterRequired;
    private double milkRequired;
    private double coffeeRequired;

    public Coffee(String name, double waterRequired, double milkRequired, double coffeeRequired) {
        this.name = name;
        this.waterRequired = waterRequired;
        this.milkRequired = milkRequired;
        this.coffeeRequired = coffeeRequired;
    }

    public abstract void prepare();

    public String getName() {
        return name;
    }

    public double getWaterRequired() {
        return waterRequired;
    }

    public double getMilkRequired() {
        return milkRequired;
    }

    public double getCoffeeRequired() {
        return coffeeRequired;
    }
}

// Classes de café concretas que estendem Coffee
class Espresso extends Coffee {
    public Espresso() {
        super("Espresso", 1.0, 0.0, 2.0);
    }

    @Override
    public void prepare() {
        System.out.println("Passo 1: Moer os grãos de café");
        System.out.println("Passo 2: Preparar o café espresso");
    }
}

class Latte extends Coffee {
    public Latte() {
        super("Latte", 1.0, 1.0, 1.0);
    }

    @Override
    public void prepare() {
        System.out.println("Passo 1: Moer os grãos de café");
        System.out.println("Passo 2: Preparar o café espresso");
        System.out.println("Passo 3: Aquecer o leite");
        System.out.println("Passo 4: Misturar o café espresso com leite vaporizado");
    }
}

class Cappuccino extends Coffee {
    public Cappuccino() {
        super("Cappuccino", 1.0, 0.5, 1.5);
    }

    @Override
    public void prepare() {
        System.out.println("Passo 1: Moer os grãos de café");
        System.out.println("Passo 2: Preparar o café espresso");
        System.out.println("Passo 3: Vaporizar o leite");
        System.out.println("Passo 4: Adicionar espuma de leite ao café espresso");
    }
}

// Classe CoffeeMachine
class CoffeeMachine {
    private double water;
    private double milk;
    private double coffee;

    public CoffeeMachine(double initialWater, double initialMilk, double initialCoffee) {
        this.water = initialWater;
        this.milk = initialMilk;
        this.coffee = initialCoffee;
    }

    public void makeCoffee(Coffee coffeeType) {
        if (water >= coffeeType.getWaterRequired() && milk >= coffeeType.getMilkRequired() && coffee >= coffeeType.getCoffeeRequired()) {
            System.out.println("Fazendo um " + coffeeType.getName() + "...");
            coffeeType.prepare();
            System.out.println("Café pronto!");
            // Deduz os ingredientes usados
            water -= coffeeType.getWaterRequired();
            milk -= coffeeType.getMilkRequired();
            coffee -= coffeeType.getCoffeeRequired();
        } else {
            System.out.println("Recursos insuficientes para fazer o café " + coffeeType.getName());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        CoffeeMachine coffeeMachine = new CoffeeMachine(10.0, 10.0, 10.0);

        Coffee espresso = new Espresso();
        Coffee latte = new Latte();
        Coffee cappuccino = new Cappuccino();

        coffeeMachine.makeCoffee(espresso);
        coffeeMachine.makeCoffee(latte);
        coffeeMachine.makeCoffee(cappuccino);
    }
}
