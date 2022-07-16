enum PastaTaste {
    case cream, tomato
}

enum PizzeDough {
    case cheeseCrust, thin, origin
}

enum PizzaTopping {
    case pepperoni, cheese, bacon
}

enum MainDish {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzeDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = MainDish.pasta(taste: PastaTaste.tomato)
dinner = MainDish.pizza(dough: .cheeseCrust, topping: .bacon)
