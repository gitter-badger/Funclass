package;

class Token {
	public var type:String;
	public var data:String;

	public function new(type:String, data:String = "") {
		this.type = type;
		this.data = data;
	}
}

class Scanner {
	public var i:Int;
	public var tokens:Array<Token>;
	public var code:String;

	public function new(input_code:String) {
		i      = 0;
		tokens = new Array<Token>();
		code   = input_code;

		var chr = "";

		while (i < code.length) {
			chr = code.charAt(i);

			if (~/[a-zA-Z_]/.match(chr)) {
				var ident = "";

				while (i < code.length && ~/[a-zA-Z0-9_]/.match(peek())) {
					ident += get_next();
				}

				i--;

				if (in_array([ "if", "while", "elsif", "else", "do", "then", "end", "return", "func" ], ident)) {
					tokens.push(new Token("KEYWORD", ident));
				} else if (ident == "and") {
					tokens.push(new Token("AND"));
				} else if (ident == "or") {
					tokens.push(new Token("OR"));
				} else if (ident == "not") {
					tokens.push(new Token("NOT"));
				} else if (ident == "yes") {
					tokens.push(new Token("YES"));
				} else if (ident == "no") {
					tokens.push(new Token("NO"));
				} else {
					tokens.push(new Token("IDENT", ident));
				}
			} else if (chr == "\"") {
				var str = "";

				get_next();

				while (i < code.length && peek() != "\"") {
					str += get_next();
				}

				tokens.push(new Token("STRING", str));
			} else if (~/[0-9]/.match(chr)) {
				var number = "";

				while (i < code.length && ~/[0-9.]/.match(peek())) {
					number += get_next();
				}

				i--;

				tokens.push(new Token("NUMBER", number));
			} else if (chr == "+") {
				tokens.push(new Token("ADD"));
			} else if (chr == "-") {
				tokens.push(new Token("SUB"));
			} else if (chr == "*") {
				tokens.push(new Token("MUL"));
			} else if (chr == "/") {
				tokens.push(new Token("DIV"));
			} else if (chr == "%") {
				tokens.push(new Token("MOD"));
			} else if (chr == "^") {
				tokens.push(new Token("POW"));
			} else if (chr == "(") {
				tokens.push(new Token("LPAREN"));
			} else if (chr == ",") {
				tokens.push(new Token("COMMA"));
			} else if (chr == ")") {
				tokens.push(new Token("RPAREN"));
			} else if (chr == "=") {
				if (peek() == "=") {
					get_next();
					tokens.push(new Token("EQ"));
				} else {
					tokens.push(new Token("AFFECT"));
				}
			} else if (chr == "<") {
				if (peek() == ">") {
					get_next();
					tokens.push(new Token("NEQ"));
				} else if (peek() == "=") {
					get_next();
					tokens.push(new Token("LTEQ"));
				} else {
					tokens.push(new Token("LT"));
				}
			} else if (chr == ">") {
				if (peek() == "=") {
					get_next();
					tokens.push(new Token("GTEQ"));
				} else {
					tokens.push(new Token("GT"));
				}
			}

			i++;
		}
	}

	public function in_array(arr:Array<Dynamic>, value:Dynamic):Bool {
		for (val in arr) {
			if (val == value)
				return true;
		}

		return false;
	}

	public function get_tokens():Array<Token> {
		return tokens;
	}

	public function get_next():String {
		if (i >= code.length)
			trace("Error reading token - unexpected end of file");

		i += 1;

		return String.fromCharCode(code.charCodeAt(i - 1));
	}
	
	public function peek():String {
		if (i >= code.length)
			return "";

		return String.fromCharCode(code.charCodeAt(i));
	}
}
