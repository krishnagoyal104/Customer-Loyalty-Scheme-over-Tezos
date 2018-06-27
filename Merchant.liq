[%%version 0.15] 

type parameter = 
  |Pay
  |Refund of int

type storage = { 
  x: (parameter, unit) contract;
  m : (int,tez) map;
  id : int;
}

let%init storage : storage = {x = TZ1pg5PMjwUyBin8SDCAeSLPbzvGHzkxpbW4;m = Map[];id = 0}

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
      let add = Map.add storage.id amount storage.m in
      let storage = storage.m <- add in
      let (_result, storage) = Contract.call storage.x 1tz storage (Pay) in
      (_result, storage)
      
  |Refund txId -> 
      match Map.find txId storage.m with
      |None -> Current.fail() 
      |Some x -> 
          let storage = storage.m <- Map.remove txId storage.m in
          let (_result, storage) = Contract.call storage.x (x-1tz) storage (Refund txId) in 
          (_result, storage)
