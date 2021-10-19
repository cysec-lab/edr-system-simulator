module ParseIndicator

open LowStar.BufferOps
open FStar.HyperStack.ST
open LowStar.Printf
open C.String

module I8 = FStar.Int8
module I16 = FStar.Int16
module I32 = FStar.Int32
module I64 = FStar.Int64

module U8 = FStar.UInt8
module U16 = FStar.UInt16
module U32 = FStar.UInt32
module U64 = FStar.UInt64

module B = LowStar.Buffer

noeq type struct_error = {
  code: I32.t;
  message: C.String.t;
}

noeq type fstar_uint8 = {
    value: U8.t;
    error: struct_error;
}

// uint8 parseIndicator(uint32 can_id, uint8 can_dlc, uint8[] data)
val parseIndicator_body:
  can_id: U32.t ->
  can_dlc: U8.t ->
  data: B.buffer U8.t ->
  
Stack (fstar_uint8: fstar_uint8) (requires fun h0 -> 
    // len(data) == 8 &&     can_id == 0x188 &&     can_dlc == 4 &&     get(data, 0) <= 0x02 &&     get(data, 1) == 0 &&     get(data, 2) == 0 &&     get(data, 3) == 0
    B.live h0 data /\ (((B.length data) = (8)) && (U32.eq can_id 0x188ul) && (U8.eq can_dlc 4uy) && (U8.lte (B.get h0 data 0) 0x02uy) && (U8.eq (B.get h0 data 1) 0uy) && (U8.eq (B.get h0 data 2) 0uy) && (U8.eq (B.get h0 data 3) 0uy))
  )
  (ensures fun h0 fstar_uint8 h1 -> 
    // (fstar_uint8.error.code == 0 &&         fstar_uint8.value == get(data, 0)) || fstar_uint8.error.code == 1
    (((I32.eq fstar_uint8.error.code 0l) && ((B.get h0 data 0) = fstar_uint8.value)) || (I32.eq fstar_uint8.error.code 1l))
  )
let parseIndicator_body can_id can_dlc data  =
    // TODO: you need to implement this function here

val parseIndicator: 
  can_id: U32.t ->
  can_dlc: U8.t ->
  data: B.buffer U8.t ->
  
  Stack (fstar_uint8: fstar_uint8) (requires fun h0 -> 
    // len(data) == 8 &&     can_id == 0x188 &&     can_dlc == 4 &&     get(data, 0) <= 0x02 &&     get(data, 1) == 0 &&     get(data, 2) == 0 &&     get(data, 3) == 0
    B.live h0 data /\ (((B.length data) = (8)) && (U32.eq can_id 0x188ul) && (U8.eq can_dlc 4uy) && (U8.lte (B.get h0 data 0) 0x02uy) && (U8.eq (B.get h0 data 1) 0uy) && (U8.eq (B.get h0 data 2) 0uy) && (U8.eq (B.get h0 data 3) 0uy))
  )
  (ensures fun h0 fstar_uint8 h1 -> 
    // (fstar_uint8.error.code == 0 &&         fstar_uint8.value == get(data, 0)) || fstar_uint8.error.code == 1
    (((I32.eq fstar_uint8.error.code 0l) && ((B.get h0 data 0) = fstar_uint8.value)) || (I32.eq fstar_uint8.error.code 1l))
  )
let parseIndicator can_id can_dlc data  = 
    // meet the preconditions
    if (let v1 = data.(0ul) in let v2 = data.(1ul) in let v3 = data.(2ul) in let v4 = data.(3ul) in ((U32.eq can_id 0x188ul) && (U8.eq can_dlc 4uy) && (U8.lte v1 0x02uy) && (U8.eq v2 0uy) && (U8.eq v3 0uy) && (U8.eq v4 0uy))) then
        parseIndicator_body can_id can_dlc data 
    else
        // TODO: you need to return an error value here if the preconditions are not met

