; Every `@end` capture is guarded with `(#not-eq? @end "")`: while a block is
; still being typed, tree-sitter inserts a zero-width MISSING closing token,
; which would otherwise end the indentation range one line too early.

; Keyword-delimited blocks: indent the body, align the closing keyword with
; the line that opened the block.
((_
  [
    "end"
    "endmodule"
    "endinterface"
    "endprogram"
    "endpackage"
    "endclass"
    "endfunction"
    "endtask"
    "endcase"
    "endgenerate"
    "endgroup"
    "endproperty"
    "endsequence"
    "endclocking"
    "endchecker"
    "endconfig"
    "endspecify"
    "endprimitive"
    "endtable"
  ] @end) @indent
  (#not-eq? @end ""))

((par_block
  (join_keyword) @end) @indent
  (#not-eq? @end ""))

; Headers can span several lines (parameter and port lists), so start the
; body indentation where the header ends.
((module_declaration
  [
    (module_ansi_header)
    (module_nonansi_header)
  ] @start
  "endmodule" @end) @indent
  (#not-eq? @end ""))

((interface_declaration
  [
    (interface_ansi_header)
    (interface_nonansi_header)
  ] @start
  "endinterface" @end) @indent
  (#not-eq? @end ""))

((program_declaration
  [
    (program_ansi_header)
    (program_nonansi_header)
  ] @start
  "endprogram" @end) @indent
  (#not-eq? @end ""))

((class_declaration
  ";" @start
  "endclass" @end) @indent
  (#not-eq? @end ""))

((function_body_declaration
  ";" @start
  "endfunction" @end) @indent
  (#not-eq? @end ""))

((task_body_declaration
  ";" @start
  "endtask" @end) @indent
  (#not-eq? @end ""))

((class_constructor_declaration
  (class_constructor_arg_list)
  .
  ")"
  .
  ";" @start
  "endfunction" @end) @indent
  (#not-eq? @end ""))

((covergroup_declaration
  ";" @start
  "endgroup" @end) @indent
  (#not-eq? @end ""))

; Single statements without begin/end:
;   if (cond)
;     stmt;
(conditional_statement
  ")" @start
  .
  (statement_or_null) @indent)

(conditional_statement
  "else" @start
  .
  (statement_or_null) @indent)

(loop_statement
  ")" @start
  .
  [
    (statement_or_null)
    (statement)
  ] @indent)

(loop_statement
  "forever" @start
  .
  [
    (statement_or_null)
    (statement)
  ] @indent)

; Brackets
((_
  "{"
  "}" @end) @indent
  (#not-eq? @end ""))

((_
  "'{"
  "}" @end) @indent
  (#not-eq? @end ""))

((_
  "["
  "]" @end) @indent
  (#not-eq? @end ""))

; Parentheses. Limited to nodes with a single pair of parentheses, so that a
; node like `if (a) ... else if (b)` does not produce overlapping ranges.
([
  (parameter_port_list
    "("
    ")" @end)
  (list_of_port_declarations
    "("
    ")" @end)
  (list_of_ports
    "("
    ")" @end)
  (parameter_value_assignment
    "("
    ")" @end)
  (hierarchical_instance
    "("
    ")" @end)
  (named_port_connection
    "("
    ")" @end)
  (named_parameter_assignment
    "("
    ")" @end)
  (function_body_declaration
    "("
    ")" @end)
  (task_body_declaration
    "("
    ")" @end)
  (function_prototype
    "("
    ")" @end)
  (task_prototype
    "("
    ")" @end)
  (class_constructor_prototype
    "("
    ")" @end)
  (tf_call
    "("
    ")" @end)
  (system_tf_call
    "("
    ")" @end)
  (method_call_body
    "("
    ")" @end)
  (class_new
    "("
    ")" @end)
  (primary
    "("
    ")" @end)
  (constant_primary
    "("
    ")" @end)
  (modport_item
    "("
    ")" @end)
  (covergroup_declaration
    "("
    ")" @end)
  (cover_point
    "("
    ")" @end)
  (cover_cross
    "("
    ")" @end)
  (property_declaration
    "("
    ")" @end)
  (sequence_declaration
    "("
    ")" @end)
  (checker_declaration
    "("
    ")" @end)
  (checker_instantiation
    "("
    ")" @end)
  (sequence_instance
    "("
    ")" @end)
  (property_spec
    "("
    ")" @end)
  (assert_property_statement
    "("
    ")" @end)
  (assume_property_statement
    "("
    ")" @end)
  (cover_property_statement
    "("
    ")" @end)
  (simple_immediate_assert_statement
    "("
    ")" @end)
  (deferred_immediate_assert_statement
    "("
    ")" @end)
  (event_control
    "("
    ")" @end)
  (wait_statement
    "("
    ")" @end)
  (cast
    "("
    ")" @end)
  (constant_cast
    "("
    ")" @end)
  (let_declaration
    "("
    ")" @end)
  (udp_instance
    "("
    ")" @end)
  (text_macro_usage
    "("
    ")" @end)
] @indent
  (#not-eq? @end ""))

((attribute_instance
  "(*"
  "*)" @end) @indent
  (#not-eq? @end ""))

(block_comment) @indent

; Used by `decrease_indent_patterns` in config.toml to align `else` with its `if`.
(conditional_statement) @start.if

; A freshly typed `else` often turns the surrounding code into an ERROR node.
(ERROR
  "if" @start.if)
