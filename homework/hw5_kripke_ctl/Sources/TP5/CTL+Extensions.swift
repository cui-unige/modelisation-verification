//
//  CTL+CustomString.swift
//  TP5
//
//  Created by Damien Morard on 13.11.18.
//


extension CTL {
  // All functions to reduce CTL Formula in basic cases
  public static func reduce(_ ctl_formula: CTL) -> CTL {
    
    // Generators
    switch ctl_formula {
    case .ap(let ap):
      return .ap(ap)
    case .true:
      return .true
    case .not(let x):
      let red = reduce(x)
      switch red {
      case .not(let x):
        return reduce(x)
      case let x:
        return .not(reduce(x))
      }
    case .or(.true, _):
      // TODO
      break
    case .or(_, .true):
      // TODO
      break
    case .or(let x, let y):
      // TODO
      break
    case .ex(let x):
      // TODO
      break
    case .eg(let x):
      // TODO
      break
    case .eu(let x, let y):
      // TODO
      break
      
    // Can be derived with generators
    case .false:
      // TODO
      break
    case .and(let x, .true):
      // TODO
      break
    case .and(.true, let x):
      // TODO
      break
    case .and(let x, let y):
      // TODO
      break
    case .implies(let x, let y):
      // TODO
      break
    case .ax(let x):
      // TODO
      break
    case .af(let x):
      // TODO
      break
    case .ef(let x):
      // TODO
      break
    case .ag(let x):
      // TODO
      break
    case .au(let x, let y):
      // TODO
      break
    case .aw(let x, let y):
      // TODO
      break
    case .ew(let x, let y):
      // TODO
      break
      
    }
    
    // At the end you don't need this return (you can remove it)
    return .true
  }
  
  
}


extension AP: CustomStringConvertible {
  // Computed properties to have a nice print
  public var description: String {
    switch self {
    case .x: return "x"
    case .y: return "y"
    case .z: return "z"
    }
  }
}


extension CTL: CustomStringConvertible {
  // Computed properties to have a nice print
  public var description: String {
    switch self {
    case .ap(let x): return "\(x)"
    case .true: return "true"
    case .false: return "false"
    case .not(let x): return "not(\(x))"
    case .and (let x, let y): return "And(\(x), \(y))"
    case .or(let x, let y): return "Or(\(x), \(y))"
    case .implies(let x, let y): return "Implies(\(x), \(y))"
    case .ax(let x): return "AX(\(x))"
    case .ex(let x): return "EX(\(x))"
    case .af(let x): return "AF(\(x))"
    case .ef(let x): return "EF(\(x))"
    case .ag(let x): return "AG(\(x))"
    case .eg(let x): return "EG(\(x))"
    case .au(let x, let y): return "AU(\(x), \(y))"
    case .eu(let x, let y): return "EU(\(x), \(y))"
    case .aw(let x, let y): return "AW(\(x), \(y))"
    case .ew(let x, let y): return "EW(\(x), \(y))"
      
    }
  }
}


//extension CTL: CustomStringConvertible {
//  // Computed properties to have a nice print
//  public var description: String {
//    switch self {
//    case .ap(let x): return "\(x)"
//    case .true: return "true"
//    case .false: return "false"
//    case .not(let x): return "not(\(x))"
//    case .and (let x, let y): return "(\(x) and \(y))"
//    case .or(let x, let y): return "(\(x) or \(y))"
//    case .implies(let x, let y): return "\(x) -> \(y)"
//    case .ax(let x): return "AX(\(x))"
//    case .ex(let x): return "EX(\(x))"
//    case .af(let x): return "AF(\(x))"
//    case .ef(let x): return "EF(\(x))"
//    case .ag(let x): return "AG(\(x))"
//    case .eg(let x): return "EG(\(x))"
//    case .au(let x, let y): return "(\(x) AU \(y))"
//    case .eu(let x, let y): return "(\(x) EU \(y))"
//    case .aw(let x, let y): return "(\(x) AW \(y))"
//    case .ew(let x, let y): return "(\(x) EW \(y))"
//
//    }
//  }
//}
