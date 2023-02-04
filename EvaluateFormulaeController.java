package com.empeligibility.org.controller;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayDeque;
import java.util.Collections;
import java.util.Deque;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.empeligibility.org.model.EligibilityCondition;
import com.empeligibility.org.model.Employee;
import com.empeligibility.org.repository.EligibilityConditionRepository;
import com.empeligibility.org.repository.EmployeeRepository;

public class EvaluateFormulaeController {
	static String name;;
	static String post;
	// HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();// Creating
	// HashMap

	public EvaluateFormulaeController(String name, String post) {
		System.out.println("Incontroller1");
		this.name = name;
		this.post = post;
	}

	public String replaceFormula(String expression, HashMap<Integer, Integer> map) {
		String finalreplacedformula = null;
		int sno;
		Pattern p = Pattern.compile("\\d+");
		Matcher m = p.matcher(expression);
		while (m.find()) {
			System.out.println(m.group());
			String val = m.group();
			System.out.println("digit is " + val);
			sno = Integer.parseInt(val);
			int s_no = map.get(sno);
			
			expression = expression.replace(val, String.valueOf(s_no));
		}
		System.out.println("replaced formula" + expression);

		return expression;

	}

	public int evaluate(Employee emp, EligibilityCondition eligibilityCondition)
			throws NoSuchMethodException, SecurityException, IllegalAccessException, InvocationTargetException {
		int flag = 0;
		String field = eligibilityCondition.getField();
		System.out.println("In evaluate");
		System.out.println(emp );
		System.out.println(eligibilityCondition);
		String methodName = "get" + field;
		// System.out.println("My mehtod name is: " + methodName);
		Class<?> classObj = emp.getClass();
		Method getterMethod = classObj.getDeclaredMethod(methodName, null);
		String value = eligibilityCondition.getValue();
		String operator = eligibilityCondition.getOperator();
		String empValue = getterMethod.invoke(emp).toString();
		if (field.equals("ExSalary") || field.equals("WorkExperince")|| field.equals("Age") ) {
			int empValuei = Integer.parseInt(empValue);
			int valuei = Integer.parseInt(value);
			int compare = Integer.compare(empValuei, valuei);
			System.out.println(valuei + " " + operator + empValuei);
			// System.out.println(compare);
			if (operator.equals(">") && compare >= 0) {
				flag = 1;
			}
			if (operator.equals("<") && compare <= 0) {
				flag = 1;
			}

		} else {
			// String empValue = getterMethod.invoke(emp).toString();
			if (value.equals(empValue)) {
				flag = 1;
				System.out.println(value + empValue + " are same");
			} else {
				System.out.println(value + empValue + " are not same");
			}
		}

		return flag;
	}

	public String evaluate(String expression) throws SQLException, NoSuchMethodException, SecurityException, IllegalAccessException, InvocationTargetException {
		EmployeeRepository obj = new EmployeeRepository();
		System.out.println(this.name);
		Employee emp = obj.getEmployee(this.name);
		System.out.println("In controller2");
		System.out.println(emp.getAge());
		int ans = 0;
		String result = null;
		EligibilityConditionRepository ecr = new EligibilityConditionRepository();
		EligibilityCondition ec = new EligibilityCondition();
		List<EligibilityCondition> listofec = ecr.getFields(this.post);
		System.out.println(listofec);
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();// Creating HashMap
		Vector<String> vec = new Vector<String>();
		Pattern p = Pattern.compile("\\d+");
		Matcher m = p.matcher(expression);
		while(m.find()) {
			vec.add(m.group());
		}
		Collections.sort(vec);
		Enumeration enu = vec.elements();
		  
        System.out.println("The enumeration of values are:");
  
        // Displaying the Enumeration
        while (enu.hasMoreElements()) {
            System.out.println(enu.nextElement());
        }
	//	EligibilityCondition[] eligibilityConditions;
        for(int i=0;i<listofec.size();i++){
            System.out.println(listofec.get(i));
        } 
        for (EligibilityCondition eligibilityCondition : listofec)
		{
			int sno = eligibilityCondition.getSrNo();
			System.out.println("sno="+Integer.toString(sno));
			String s_sno = Integer.toString(sno);
			if(vec.contains(s_sno)){
				int zeroOrOne = evaluate(emp, eligibilityCondition);
				System.out.println("zeroOrOne"+zeroOrOne);
				map.put(sno, zeroOrOne);
			}
		}
	
		 
		for (Map.Entry m1 : map.entrySet()) {
			System.out.println(m1.getKey() + " " + m1.getValue());
		}

//		String normalexp = NormalizeExpression(expression);
		// finalEvaluation(normalexp);
		String finalExpression = replaceFormula(expression, map);
		System.out.println("finalExpression is"+finalExpression);
//		finalEvaluation(finalExpression,map);
		String normalexp = NormalizeExpression(finalExpression);
		if (!areBracketsBalanced(normalexp) && !validateexpression(normalexp)) {
			// next function
			result= "Incorrect Formula";
			System.out.println("Invalid Expression");
			ans =  evaluateExpression(normalexp);
			/*
			 * if(ans>=1) { result = "True"; } else { result= "False"; }
			 * System.out.println("Valid Expression");
			 */
		} else if(areBracketsBalanced(normalexp) && validateexpression(normalexp)) {
			ans =  evaluateExpression(normalexp);
			if(ans>=1) {
				result =  "True";
			}
			else {
				result= "False";
			}
			/*
			 * result= "Incorrect Formula"; System.out.println("Invalid Expression");
			 */
		}
		return result;
		// }
	}

	public String NormalizeExpression(String expression) {
		System.out.println(expression.trim());
		String andd = expression.replace("and", "*");
		String orr = andd.replace("OR", "+");
		System.out.println(orr);
		String exp = orr.replaceAll("\\s+", "");
		System.out.println(exp);
		return exp;
	}

	static boolean areBracketsBalanced(String expr) {
		// Using ArrayDeque is faster than using Stack class
		Deque<Character> stack = new ArrayDeque<Character>();

		for (int i = 0; i < expr.length(); i++) {
			char x = expr.charAt(i);

			if (x == '(' || x == '[' || x == '{') {
				stack.push(x);
				continue;
			}

			char check;
			switch (x) {
			case ')':
				check = stack.pop();
				if (check == '{' || check == '[')
					return false;
				break;

			case '}':
				check = stack.pop();
				if (check == '(' || check == '[')
					return false;
				break;

			case ']':
				check = stack.pop();
				if (check == '(' || check == '{')
					return false;
				break;
			}
		}

		// Check Empty Stack
		return (stack.isEmpty());
	}

	public boolean validateexpression(String exp) {
		boolean bl = true;
		if (exp.contains("**") || exp.contains("*+") || exp.contains("+*") || exp.contains("++")) {
			bl = false;
		}
		return bl;
	}

	public int finalEvaluation() {
		return 1;
	}

	public static int evaluateExpression(String expression) {
		char[] tokens = expression.toCharArray();

		// Stack for numbers: 'values'
		Stack<Integer> values = new Stack<Integer>();

		// Stack for Operators: 'ops'
		Stack<Character> ops = new Stack<Character>();

		for (int i = 0; i < tokens.length; i++) {

			// Current token is a
			// whitespace, skip it
			if (tokens[i] == ' ')
				continue;

			// Current token is a number,
			// push it to stack for numbers
			if (tokens[i] >= '0' && tokens[i] <= '9') {
				StringBuffer sbuf = new StringBuffer();

				// There may be more than one
				// digits in number
				while (i < tokens.length && tokens[i] >= '0' && tokens[i] <= '9')
					sbuf.append(tokens[i++]);
				values.push(Integer.parseInt(sbuf.toString()));

				// right now the i points to
				// the character next to the digit,
				// since the for loop also increases
				// the i, we would skip one
				// token position; we need to
				// decrease the value of i by 1 to
				// correct the offset.
				i--;
			}

			// Current token is an opening brace,
			// push it to 'ops'
			else if (tokens[i] == '(')
				ops.push(tokens[i]);

			// Closing brace encountered,
			// solve entire brace
			else if (tokens[i] == ')') {
				while (ops.peek() != '(')
					values.push(applyOp(ops.pop(), values.pop(), values.pop()));
				ops.pop();
			}

			// Current token is an operator.
			else if (tokens[i] == '+' || tokens[i] == '-' || tokens[i] == '*' || tokens[i] == '/') {
				// While top of 'ops' has same
				// or greater precedence to current
				// token, which is an operator.
				// Apply operator on top of 'ops'
				// to top two elements in values stack
				while (!ops.empty() && hasPrecedence(tokens[i], ops.peek()))
					values.push(applyOp(ops.pop(), values.pop(), values.pop()));

				// Push current token to 'ops'.
				ops.push(tokens[i]);
			}
		}

		// Entire expression has been
		// parsed at this point, apply remaining
		// ops to remaining values
		while (!ops.empty())
			values.push(applyOp(ops.pop(), values.pop(), values.pop()));

		// Top of 'values' contains
		// result, return it
		return values.pop();
	}

	public static boolean hasPrecedence(char op1, char op2) {
		if (op2 == '(' || op2 == ')')
			return false;
		if ((op1 == '*' || op1 == '/') && (op2 == '+' || op2 == '-'))
			return false;
		else
			return true;
	}

	// A utility method to apply an
	// operator 'op' on operands 'a'
	// and 'b'. Return the result.
	public static int applyOp(char op, int b, int a) {
		switch (op) {
		case '+':
			return a + b;
		case '-':
			return a - b;
		case '*':
			return a * b;
		case '/':
			if (b == 0)
				throw new UnsupportedOperationException("Cannot divide by zero");
			return a / b;
		}
		return 0;
	}

}
