obj Calculator {
    has num_operations: int = 3;
    has history: list[str] = [];

    can start {
        print("Welcome to Smart Calculator!");
        print("You can perform " + str(self.num_operations) + " operations.");

        for i in range(0, self.num_operations) {
            op = input("Enter operation (+, -, *, /): ");
            a = input("Enter first number: ");
            b = input("Enter second number: ");

            try {
                x = float(a);
                y = float(b);

                if op == "+" {
                    result = x + y;
                } elif op == "-" {
                    result = x - y;
                } elif op == "*" {
                    result = x * y;
                } elif op == "/" {
                    result = x / y;
                } else {
                    print("Unknown operation: " + op);
                    AIHelper(op=op) spawn root;
                    continue;
                }

                print("Result: " + str(result));
                self.history.append(a + " " + op + " " + b + " = " + str(result));
            } except Exception {
                print("Invalid input. Please enter valid numbers.");
            }
        }

        print("Calculation History:");
        for item in self.history {
            print(item);
        }
    }
}

walker AIHelper {
    has op: str;

    can run with `root entry {
        print(self.op + " isn't a supported operation.");
        print("The user typed '" + self.op + "' as a math operation. Suggest a valid alternative (+, -, *, /).");
    }
}

