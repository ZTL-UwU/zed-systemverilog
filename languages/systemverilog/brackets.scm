("(" @open
  ")" @close)

("[" @open
  "]" @close)

("{" @open
  "}" @close)

("'{" @open
  "}" @close)

(("\"" @open
  "\"" @close)
  (#set! rainbow.exclude))

; Keyword-delimited blocks: matched and highlighted, but not rainbow-colored.
((seq_block
  "begin" @open
  "end" @close)
  (#set! rainbow.exclude))

((generate_block
  "begin" @open
  "end" @close)
  (#set! rainbow.exclude))

((par_block
  "fork" @open
  (join_keyword) @close)
  (#set! rainbow.exclude))

((case_statement
  (case_keyword) @open
  "endcase" @close)
  (#set! rainbow.exclude))

((randcase_statement
  "randcase" @open
  "endcase" @close)
  (#set! rainbow.exclude))

((generate_region
  "generate" @open
  "endgenerate" @close)
  (#set! rainbow.exclude))

((module_declaration
  [
    (module_ansi_header
      (module_keyword) @open)
    (module_nonansi_header
      (module_keyword) @open)
  ]
  "endmodule" @close)
  (#set! rainbow.exclude))

((interface_declaration
  [
    (interface_ansi_header
      "interface" @open)
    (interface_nonansi_header
      "interface" @open)
  ]
  "endinterface" @close)
  (#set! rainbow.exclude))

((program_declaration
  [
    (program_ansi_header
      "program" @open)
    (program_nonansi_header
      "program" @open)
  ]
  "endprogram" @close)
  (#set! rainbow.exclude))

((package_declaration
  "package" @open
  "endpackage" @close)
  (#set! rainbow.exclude))

((class_declaration
  "class" @open
  "endclass" @close)
  (#set! rainbow.exclude))

((function_declaration
  "function" @open
  (function_body_declaration
    "endfunction" @close))
  (#set! rainbow.exclude))

((class_constructor_declaration
  "function" @open
  "endfunction" @close)
  (#set! rainbow.exclude))

((task_declaration
  "task" @open
  (task_body_declaration
    "endtask" @close))
  (#set! rainbow.exclude))

((covergroup_declaration
  "covergroup" @open
  "endgroup" @close)
  (#set! rainbow.exclude))

((clocking_declaration
  "clocking" @open
  "endclocking" @close)
  (#set! rainbow.exclude))

((property_declaration
  "property" @open
  "endproperty" @close)
  (#set! rainbow.exclude))

((sequence_declaration
  "sequence" @open
  "endsequence" @close)
  (#set! rainbow.exclude))

((checker_declaration
  "checker" @open
  "endchecker" @close)
  (#set! rainbow.exclude))
