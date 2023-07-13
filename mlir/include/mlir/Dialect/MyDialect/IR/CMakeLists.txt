set(LLVM_TARGET_DEFINITIONS MyDialectOps.td)
add_mlir_dialect(MyDialectOps mydialect)
add_mlir_doc(MyDialectOps MyDialectOps Dialects/ -gen-dialect-doc)
