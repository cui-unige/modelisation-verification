import LogicKit
import Foundation

public class Nat: ADT{
  public init(){
    super.init("Nat")

    self.add_generator("zero", Nat.zero)
    self.add_generator("succ", Nat.succ, arity: 1)

    self.add_operator("+", Nat.add, [
      Rule(
        Nat.add(Variable(named: "x"), Nat.zero()),
        Variable(named: "x")
      ),
      Rule(
        Nat.add(Variable(named: "x"), Nat.succ(x: Variable(named: "y"))),
        Nat.succ(x: Nat.add(Variable(named: "x"),Variable(named:"y"))))
    ],["nat", "nat"])
    
    // TODO: mul (multiplication)
    self.add_operator("*", Nat.mul,[
      // Here
    ],["nat", "nat"])
    
    // TODO: pre (predecessor) (pre(5) = 4)
    self.add_operator("pre", Nat.pre,[
      // Here
    ],["nat"])
    
    // TODO: sub (substraction)
    self.add_operator("-", Nat.sub,[
      //Here
    ],["nat", "nat"])
    
    // TODO: lt (lesser than) (4 < 3 -> False)
    self.add_operator("<", Nat.lt,[
      // Here
    ],["nat", "nat"])
    
    // TODO: gt (greater than)
    self.add_operator(">", Nat.gt,[
      // Here
    ],["nat", "nat"])
    
    // TODO: eq (equal)
    self.add_operator("==", Nat.eq,[
      // Here
    ],["nat", "nat"])
    
    // TODO: mod (modulo) (10 % 4 = 2)
    // You can return vFail if it's undefined
    self.add_operator("%", Nat.mod,[
      // Here
    ],["nat", "nat"])
    
    // TODO: gcd (Greatest common divisor) (gcd(20, 12) = 4)
    self.add_operator("gcd", Nat.gcd,[
      // Here
    ],["nat", "nat"])
    
    // TODO: div (euclidean division) (div(10/3) = 3)
    // You can return vFail if it's undefined
    self.add_operator("/", Nat.div,[
      // Here
    ],["nat", "nat"])
  }

  //Generator
  static public func zero(_:Term...) -> Term{
    return new_term(Value<Int>(0),"nat")
  }

  static public func succ(x: Term...) -> Term {
    return new_term(Map(["succ": x[0]]),"nat")
  }

  static public func n(_ x: Int) -> Term {
  	if x==0{
  		return Nat.zero()
  	}
    var t = Nat.zero()
  	for _ in 1..<x+1 {
  		t = Nat.succ(x: t)
  	}
    return t
  }

  static public func to_int(_ term:Term) -> Int {
    if let map = (value(term) as? Map){
      if map["succ"] != nil{
        let k = Nat.to_int(map["succ"]!)
        return k+1
      }
    }
    return 0
  }

  public class override func belong(_ x: Term) -> Goal{
    return (x === Nat.zero() || delayed(fresh {y in x === Nat.succ(x:y) && Nat.belong(y)}))
  }

  public override func pprint(_ term: Term) -> String{
    return Nat.to_string(term)
  }


  static public func to_string(_ x: Term) -> String{
   	if x.equals(Nat.zero()){
   		return "0"
   	}
   	if let map = (value(x) as? Map){
      if map["succ"] != nil{
        let k = Nat.to_string(map["succ"]!)
        let f = k.components(separatedBy:"+")
        if f.count == 0{
          return k
        }
        if f.count == 1{
          if let i = Int(k){
            return String(1+i)
          }
          return "succ(\(k))"
        }
        if f[0].count == 0 {
     		   return "succ("+f[1]+")"
        }
        if let i = (Int(f[0])){
          return String(1+i)+" + "+f[1]
        }
        return "succ(\(k))"
      }
      return ADTm.pprint(map)
   	}
    if x is Variable {
      return "+"+ADTm.pprint(x)
    }
   	return ADTm.pprint(x)
  }

  public static func add(_ operands: Term...) -> Term{
      return Operator.n("+",operands[0], operands[1])
  }
  public static func mul(_ operands: Term...)-> Term{
    return Operator.n("*",operands[0], operands[1])
  }
  public static func pre(_ operands: Term...) -> Term{
    return Operator.n("pre", operands[0])
  }
  public static func sub(_ operands: Term...) -> Term{
    return Operator.n("-", operands[0], operands[1])
  }
  public static func div(_ operands: Term...) -> Term{
    return Operator.n("/", operands[0], operands[1])
  }
  public static func mod(_ operands: Term...) -> Term{
    return Operator.n("%", operands[0], operands[1])
  }
  public static func lt(_ operands: Term...) -> Term{
    return Operator.n("<", operands[0], operands[1])
  }
  public static func gt(_ operands: Term...) -> Term{
    return Operator.n(">", operands[0], operands[1])
  }
  public class func eq(_ operands: Term...) -> Term{
    return Operator.n("==", operands[0], operands[1])
  }
  public class func gcd(_ operands: Term...) -> Term{
    return Operator.n("gcd", operands[0], operands[1])
  }
}


public class Integer: ADT{
  public init(){
    super.init("int")
    self.add_generator("int", Integer.int)
    self.add_operator("+", Integer.add, [
      Rule(
        Integer.add(
          Integer.int(Variable(named: "a"),Variable(named: "b")),
          Integer.int(Variable(named: "c"),Variable(named: "d"))
        ),
        Integer.int(
          Nat.add(Variable(named: "a"),Variable(named: "c")),
          Nat.add(Variable(named: "b"),Variable(named: "d"))
        )
      )
    ], ["int", "int"])
    
    // TODO: sub (substraction)
    self.add_operator("-", Integer.sub, [
      // Here
    ], ["int", "int"])

    // TODO: abs (absolute value) (abs(-3) = 3
    // In the case of Integer: abs(0,3) = (3,0)
    self.add_operator("abs", Integer.abs, [
      // Here
    ], ["int"])
    
    // TODO: normalize (normalize(4,2) = (2,0)
    // normalize(3,10) = (0,7))
    self.add_operator("normalize", Integer.normalize, [
      // Here
    ], ["int"])
    
    // TODO: mul (multiplication)
    self.add_operator("*", Integer.mul, [
      // Here
    ], ["int", "int"])
    
    // TODO: eq (equal)
    self.add_operator("==", Integer.eq, [
      // Here
    ], ["int", "int"])
    
    // TODO: lt (lesser than)
    self.add_operator("<", Integer.lt, [
      // Here
    ], ["int", "int"])
    
    // TODO: gt (greater than)
    self.add_operator(">", Integer.gt, [
      // Here
    ], ["int", "int"])
    
    // TODO: sign (sign(6,2) = True, sign(4,10) = False)
    // sign(0,0) = False
    self.add_operator("sign", Integer.sign, [
      // Here
    ], ["int"])
    
    // TODO: div (euclidian division)
    // Help: Condition for the division is a simple xor which verify
    // a < b xor c < d (with integer1 = (a,b) and integer2 = (c,d)
    self.add_operator("/", Integer.div, [
      // Here
    ], ["int", "int"])
  }

  static public func int(_ x: Term...) -> Term {
    return new_term(Map(["a": x[0], "b":x[1]]),"int")
  }

  static public func n(_ x: Int) -> Term {
    let abs_x = Swift.abs(x)
    if x>0{
      return Integer.int(Nat.n(abs_x),Nat.zero())
    }
    return Integer.int(Nat.zero(),Nat.n(abs_x))
  }

  static public func to_int(_ term:Term) -> Int {
    if let map = (value(term) as? Map){
      if map["a"] != nil && map["b"] != nil {
        let pos = Nat.to_int(map["a"]!)
        let neg = Nat.to_int(map["b"]!)
        return pos-neg
      }
    }
    return 0
  }

  public static func to_string(_ term: Term) -> String {
    if let map = (value(term) as? Map){
      if map["a"] != nil && map["b"] != nil {
        let pos = Nat.to_string(map["a"]!)
        let neg = Nat.to_string(map["b"]!)
        return "Int(+:\(pos), -:\(neg))"
      }
    }
    return ""
  }

  public class override func belong(_ x: Term) -> Goal{
    return (delayed(fresh {y in fresh {z in x === Integer.int(y,z) && Nat.belong(y) && Nat.belong(z)}}))
  }

  public override func pprint(_ term: Term) -> String{
    if let map = (value(term) as? Map) {

      let a : Term = ADTm.eval(map["a"]!)
      let b : Term = ADTm.eval(map["b"]!)
      if type(a)=="nat" && type(b) == "nat"{
        if ADTm.eval(Nat.eq(a,b)).equals(Boolean.True()){
          return "0"
        }
        if ADTm.eval(Nat.gt(a,b)).equals(Boolean.True()){
          return "+\(ADTm.pprint(ADTm.eval(Nat.sub(a,b))))"
        }
        return "-\(ADTm.pprint(ADTm.eval(Nat.sub(b,a))))"
      }
      return "FAIL"
    }
    if let variable = (term as? Variable){
      return variable.description
    }
    return Nat.to_string(term)
  }

  static public func add(_ terms: Term...)->Term{
    return Operator.n("+",terms[0], terms[1])
  }
  static public func sub(_ terms: Term...)->Term{
    return Operator.n("-",terms[0], terms[1])
  }
  static public func abs(_ terms: Term...)->Term{
    return Operator.n("abs",terms[0])
  }
  static public func normalize(_ terms: Term...)->Term{
    return Operator.n("normalize",terms[0])
  }
  static public func mul(_ terms: Term...)->Term{
    return Operator.n("*",terms[0], terms[1])
  }
  static public func eq(_ terms: Term...)->Term{
    return Operator.n("==",terms[0], terms[1])
  }
  public static func lt(_ operands: Term...) -> Term{
    return Operator.n("<", operands[0], operands[1])
  }
  public static func gt(_ operands: Term...) -> Term{
    return Operator.n(">", operands[0], operands[1])
  }
  public static func div(_ operands: Term...) -> Term{
    return Operator.n("/", operands[0], operands[1])
  }
  public static func sign(_ operands: Term...) -> Term{
    return Operator.n("sign", operands[0])
  }

}
