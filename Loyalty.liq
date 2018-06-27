[%%version 0.15] 

type storage = { 
  m : (int, tez) map;
  id : int;
} 

let%init storage : storage = {m = Map[];id = 0}
                             
let get_caller (_ : unit) =
  let c = (Source : (unit, unit) contract) in
  Contract.manager c 
    
type parameter = 
  |Pay
  |Refund of int

let%entry main 
    (parameter : parameter)
    (storage : storage)
  : unit * storage = 
  
  match parameter with
  
  |Pay ->
      
      let func (i:int) = (i+1) in
      let _id = func storage.id in
      let storage = storage.id <- _id in
      let amount = Current.amount() in 
      let storage = storage.m <- Map.add storage.id amount storage.m in
      ((), storage)
      
  |Refund txId -> 
      let caller = get_caller() in
      let customer = Account.default caller in 
      let amount = Current.amount() in
      match Map.find txId storage.m with
      |None -> Current.fail() 
      |Some x -> 
          let storage = storage.m <- Map.remove txId storage.m in
          let (_result, storage) = Contract.call customer (amount + x) storage () in 
          (_result, storage)           