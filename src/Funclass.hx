package;

class Funclass {
	public static function main():Void {
		var lex = new Scanner("
			func add(a, b) do
				return (a + b) * 2
			end

			life = add(40, 2)

			if life == 42 then
				print(\"Life is not 42\")
			else
				print(\"Life is\"+life)
			end
		");

		for (token in lex.get_tokens()) {
			Sys.println(token.type + (token.data != "" ? " : " + token.data : ""));
		}

		Sys.stdin().readLine();
	}
}
