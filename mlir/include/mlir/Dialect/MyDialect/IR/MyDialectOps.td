//===- MyDialectOps.td - MyDialect op definitions ------------------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef MYDIALECT_OPS
#define MYDIALECT_OPS

include "mlir/IR/OpBase.td"
include "mlir/IR/AttrTypeBase.td"

//===----------------------------------------------------------------------===//
// MyDialect
//===----------------------------------------------------------------------===//

def MyDialect_Dialect : Dialect {
  let name = "mydialect";
}

//===----------------------------------------------------------------------===//
// SpecialOp
//===----------------------------------------------------------------------===//

def MyDialect_SpecialType : TypeDef<MyDialect_Dialect, "Special", []> {
  let mnemonic = "special";
  let summary = "MyDialect custom type";
  let description = "Custom type in MyDialect dialect";
  let parameters = (ins "uint32_t":$value);
  let assemblyFormat = "`<` $value `>`";
  let extraClassDeclaration = [{
    int this_is_a_special_value_i_can_find = 42;
  }];
}

def MyDialect_CustomAttr : AttrDef<MyDialect_Dialect, "Custom", []> {
  let mnemonic = "custom";
  let parameters = (ins "uint32_t":$value);
  let assemblyFormat = "`<` $value `>`";
  let extraClassDeclaration = [{
    int this_should_pop_up_whereever_CustomAttr_is_defined = 42;
  }];
}

def MyDialect_SpecialOp : Op<MyDialect_Dialect, "special", []>
{
  let arguments = (ins MyDialect_SpecialType:$special);
  let results = (outs I32:$out);
  let assemblyFormat = "$special `,` attr-dict `:` type($special)";
}

#endif // MYDIALECT_OPS
