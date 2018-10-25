import LogicKit

//// SET
//// https://en.wikipedia.org/wiki/Set_(abstract_data_type)
public class Set : ADT {
  public init(){
    super.init("set")
    
    self.add_generator("empty", Set.empty)
    self.add_generator("cons", Set.cons, arity:2)
    
    self.add_operator("contains", Set.contains, [
      // TODO
      ], ["set", "any"])
    
    self.add_operator("removeOne", Set.removeOne,[
      // TODO
      ], ["set", "any"])
    
    self.add_operator("==", Set.eq,[
      // TODO
      ], ["set", "set"])
    
    self.add_operator("insert", Set.insert, [
      // TODO
      ], ["any", "set"])
    
    self.add_operator("union", Set.union, [
     // TODO
      ], ["set", "set"])
    
    self.add_operator("intersection", Set.intersection, [
     // TODO
      ], ["set", "set"])
    
    self.add_operator("diff", Set.diff, [
     // TODO
      ], ["set", "set"])
    
    self.add_operator("subSet", Set.subSet, [
     // TODO
      ], ["set", "set"])
    
    self.add_operator("size", Set.size, [
     // TODO
      ], ["set"])

  }
  public static func empty(_ :Term...) -> Term{
    return new_term(Value<String>("Set.tail"),"set")
  }
  
  public static func cons(_ terms: Term...) -> Term{
    return new_term(Map([
      "first": terms[0],
      "rest": terms[1]
      ]), "set")
  }
  
  public static func contains(_ terms: Term...)->Term{
    return Operator.n("contains", terms[0], terms[1] )
  }
  public static func size(_ terms: Term...)->Term{
    return Operator.n("size",terms[0])
  }
  
  public static func removeOne(_ terms: Term...)->Term{
    return Operator.n("removeOne",terms[0], terms[1])
  }

  public class func eq(_ terms: Term...)-> Term
  {
    return Operator.n("==",terms[0],terms[1])
  }

  public static func insert(_ terms: Term...)->Term{
    return Operator.n("insert",terms[0], terms[1])
  }
  
  public static func union(_ terms: Term...)->Term{
    return Operator.n("union", terms[0], terms[1])
  }
  
  public static func intersection(_ terms: Term...)->Term{
    return Operator.n("intersection", terms[0], terms[1])
  }
  
  public static func diff(_ terms: Term...)->Term{
    return Operator.n("diff", terms[0], terms[1])
  }
  
  public static func subSet(_ terms: Term...)->Term{
    return Operator.n("subSet",terms[0], terms[1])
  }
  
  public class override func belong(_ x: Term) -> Goal{
    return (x === Set.empty() || delayed(fresh {y in fresh{w in x === Set.cons(y,w) && Set.belong(w)}}))
  }
  
  public class func n(_ terms: [Term]) -> Term{
    let n = terms.count
    if n == 0 {
      return Set.empty()
    }
    return Set.insert(terms[0],Set.n(Array<Term>(terms.suffix(n-1))))
  }
  
  public override func pprint(_ t: Term) -> String{
    var s : String = "{"
    var x = t
    var i = 0
    while !x.equals(Set.empty()){
      if i>0{
        s += ", "
      }
      if let v = (x as? Variable){
        s += v.name
        x = Set.empty()
      }
      else if let m = (value(x) as? Map){
        s += ADTm.pprint(m["first"]!)
        x = m["rest"]!
      }else{
        x = Set.empty()
      }
      i += 1
    }
    return s + "}"
  }
}
