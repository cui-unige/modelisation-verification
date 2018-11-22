//
//  Kripke+Extensions.swift
//  TP5
//
//  Created by Damien Morard on 13.11.18.
//

extension Kripke {

  public func pre(state_list: Set<String>) -> Set<String> {
    // Return the set of pre state
    // Ex: If we have: state = {"s0", "s1", "s2"}, trans = {("s0","s1"), ("s0", "s2")}
    // Then pre({"s1", "s2"}) = {"s0"}
    var new_state_list: Set<String> = []
    for transition in self.transitions {
      // transition[0]: from
      // transition[1]: to
      // Ex: (s0, s1) which means from s0 to s1
      if state_list.contains(where: {$0 == transition[1]}) {
        new_state_list.insert(transition[0])
      }
    }
    return new_state_list
  }

  public func compute(_ ctl_formula: CTL) -> Set<String> {
    // Compute a CTL formula and return a list of state
    // which verifiy CTL formula

    switch ctl_formula {

    case .ap(let x):
      var state_list: Set<String> = []
      for node in self.nodes {
        if node.value.contains(x) {
          state_list.insert(node.key)
        }
      }
      return state_list

    case .true:
      // TODO
      return []

    case .not(let x):
      // TODO
      return []

    case .or(let x, let y):
      // TODO
      return []

    case .ex(let x):
      // TODO
      return []

    case .ef(let x):
      // TODO
      return []

    case .eg(let x):
      // TODO
      return []

    case .eu(let x, let y):
      // TODO
      return []

    // Don't touch the default value
    default: return []
    }

  }

}


extension Kripke: CustomStringConvertible {
  // Computed properties to have a nice print
  public var description: String {
    var string_nodes: String = ""
    var string_transitions: String = ""

    for node in nodes {
      string_nodes = "\(string_nodes)\n\(node.key): \(node.value)"
    }

    for transition in transitions {
      string_transitions = "\(string_transitions)\n\(transition[0]) -> \(transition[1])"
    }

    return "\(string_nodes)\n\(string_transitions)"
  }
}
