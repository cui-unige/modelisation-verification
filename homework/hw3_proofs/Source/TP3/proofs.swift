import LogicKit


//// namespace containing all the operations to prove an axiom
public struct Proof {

  public static func reflexivity(_ term: Term)->Rule{
    // TODO: Replace vFail
    return Rule(vFail,vFail)
  }

  public static func symmetry(_ rule: Rule) -> Rule{
    // TODO: Replace vFail
    return Rule(vFail, vFail, vFail)/rule.variables()
  }

  public static func transitivity(_ lhs: Rule, _ rhs: Rule) -> Rule{
    if equivalence(lhs.rTerm(),rhs.lTerm()){
      let condition : Term
      if equivalence(lhs.condition(), rhs.condition()){
        // TODO
      }else{
        // TODO
      }
      // TODO: Change the value of this return
      return Rule(vFail, vFail)
    }
    // Don't change the return below
    return Rule(vNil,vNil)
  }

  public static func substitutivity(_ operation: @escaping (Term...)->Term, _ rules: [Rule])->Rule{
    // Look at tests for examples
    // operation_c will be necessary to cast a list of term to one term
    typealias Function = ([Term]) -> Term
    let operation_c = unsafeBitCast(operation, to: Function.self)

    // TODO
    // Here

    // Think to replace vFail when you'll complete the function
    let lhs: Term = vFail
    let rhs: Term = vFail
    
    return Rule(lhs, rhs)/rules[0].variables()
  }

  public static func substitution(_ rule: Rule, _ variable: Variable, _ replacement: Term)-> Rule{
    let v = variable

    let lhs = subst_variable(rule.h_lTerm(), v, replacement)
    let rhs = subst_variable(rule.h_rTerm(), v, replacement)
    let condition = subst_variable(rule.h_condition(), v, replacement)

    return Rule(lhs, rhs, condition)
  }

}
