; Patterns later in this file take precedence over earlier ones.

; Identifiers
; -----------

((simple_identifier) @constant
  (#match? @constant "^[A-Z][A-Z0-9_]*$"))

; Types
; -----

(data_type
  (simple_identifier) @type)

(class_type
  (simple_identifier) @type)

(package_scope
  (simple_identifier) @type)

(package_import_item
  (simple_identifier) @type)

(type_declaration
  type_name: (simple_identifier) @type)

(interface_port_header
  interface_name: (simple_identifier) @type)

(net_port_type
  (simple_identifier) @type)

[
  (integer_vector_type)
  (integer_atom_type)
  (non_integer_type)
  (net_type)
  "string"
  "chandle"
  "event"
  "void"
  "signed"
  "unsigned"
  "untyped"
] @type.builtin

; Declarations
; ------------

(module_ansi_header
  name: (simple_identifier) @type)

(module_nonansi_header
  name: (simple_identifier) @type)

(interface_ansi_header
  name: (simple_identifier) @type)

(interface_nonansi_header
  name: (simple_identifier) @type)

(program_ansi_header
  name: (simple_identifier) @type)

(program_nonansi_header
  name: (simple_identifier) @type)

(package_declaration
  name: (simple_identifier) @type)

(class_declaration
  name: (simple_identifier) @type)

(interface_class_declaration
  name: (simple_identifier) @type)

(checker_declaration
  name: (simple_identifier) @type)

(covergroup_declaration
  name: (simple_identifier) @type)

(function_body_declaration
  name: (simple_identifier) @function)

(task_body_declaration
  name: (simple_identifier) @function)

(function_prototype
  name: (simple_identifier) @function)

(task_prototype
  name: (simple_identifier) @function)

(class_scope
  (class_type
    (simple_identifier) @type))

(ansi_port_declaration
  port_name: (simple_identifier) @variable.parameter)

(tf_port_item
  (simple_identifier) @variable.parameter)

(param_assignment
  (simple_identifier) @constant)

(enum_name_declaration
  (simple_identifier) @constant)

(text_macro_name
  (simple_identifier) @constant)

(ifdef_condition
  (simple_identifier) @constant)

; Instances
; ---------

(module_instantiation
  instance_type: (simple_identifier) @type)

(interface_instantiation
  instance_type: (simple_identifier) @type)

(program_instantiation
  instance_type: (simple_identifier) @type)

(checker_instantiation
  instance_type: (simple_identifier) @type)

(udp_instantiation
  instance_type: (simple_identifier) @type)

(name_of_instance
  instance_name: (simple_identifier) @variable)

(named_port_connection
  port_name: (simple_identifier) @property)

(named_parameter_assignment
  (simple_identifier) @property)

(named_checker_port_connection
  port_name: (simple_identifier) @property)

; Calls
; -----

(tf_call
  (hierarchical_identifier
    (simple_identifier) @function .))

(method_call_body
  name: (simple_identifier) @function)

[
  (array_method_name)
  (queue_method_name)
  (string_method_name)
  (enum_method_name)
  "randomize"
] @function.builtin

[
  (system_tf_identifier)
  "$fatal"
  "$error"
  "$warning"
  "$info"
  "$stop"
  "$finish"
  "$exit"
  "$root"
  "$unit"
] @function.builtin

; Labels
; ------

(seq_block
  ":"
  .
  (simple_identifier) @label)

(par_block
  ":"
  .
  (simple_identifier) @label)

(generate_block
  ":"
  .
  (simple_identifier) @label)

(cover_point
  name: (simple_identifier) @label)

(cover_cross
  name: (simple_identifier) @label)

; Literals
; --------

[
  (integral_number)
  (real_number)
  (unbased_unsized_literal)
  (time_literal)
  "1step"
] @number

[
  (string_literal)
  (quoted_string)
  (triple_quoted_string)
  (system_lib_string)
  (dpi_spec_string)
] @string

(string_escape_seq) @string.escape

"null" @constant.builtin

[
  "this"
  "super"
] @variable.special

; Attributes
; ----------

(attribute_instance) @attribute

; Keywords
; --------

[
  (always_keyword)
  (module_keyword)
  (case_keyword)
  (bins_keyword)
  (edge_identifier)
  (lifetime)
  (port_direction)
  (unique_priority)
  (random_qualifier)
  (class_item_qualifier)
  (join_keyword)
  "accept_on"
  "alias"
  "and"
  "assert"
  "assign"
  "assume"
  "automatic"
  "before"
  "begin"
  "bind"
  "bins"
  "binsof"
  "break"
  "buf"
  "bufif0"
  "bufif1"
  "case"
  "casex"
  "casez"
  "cell"
  "checker"
  "class"
  "clocking"
  "cmos"
  "config"
  "const"
  "constraint"
  "context"
  "continue"
  "cover"
  "covergroup"
  "coverpoint"
  "cross"
  "deassign"
  "default"
  "defparam"
  "design"
  "disable"
  "dist"
  "do"
  "edge"
  "else"
  "end"
  "endcase"
  "endchecker"
  "endclass"
  "endclocking"
  "endconfig"
  "endfunction"
  "endgenerate"
  "endgroup"
  "endinterface"
  "endmodule"
  "endpackage"
  "endprimitive"
  "endprogram"
  "endproperty"
  "endsequence"
  "endspecify"
  "endtable"
  "endtask"
  "enum"
  "eventually"
  "expect"
  "export"
  "extends"
  "extern"
  "final"
  "first_match"
  "for"
  "force"
  "foreach"
  "forever"
  "fork"
  "forkjoin"
  "function"
  "generate"
  "genvar"
  "global"
  "highz0"
  "highz1"
  "if"
  "iff"
  "ifnone"
  "ignore_bins"
  "illegal_bins"
  "implements"
  "implies"
  "import"
  "incdir"
  "include"
  "initial"
  "inout"
  "input"
  "inside"
  "instance"
  "interconnect"
  "interface"
  "intersect"
  "join"
  "join_any"
  "join_none"
  "large"
  "let"
  "liblist"
  "library"
  "local"
  "localparam"
  "macromodule"
  "matches"
  "medium"
  "modport"
  "module"
  "nand"
  "negedge"
  "nettype"
  "new"
  "nexttime"
  "nmos"
  "nor"
  "noshowcancelled"
  "not"
  "notif0"
  "notif1"
  "or"
  "output"
  "package"
  "packed"
  "parameter"
  "pmos"
  "posedge"
  "primitive"
  "priority"
  "program"
  "property"
  "protected"
  "pull0"
  "pull1"
  "pulldown"
  "pullup"
  "pulsestyle_ondetect"
  "pulsestyle_onevent"
  "pure"
  "rand"
  "randc"
  "randcase"
  "randsequence"
  "rcmos"
  "ref"
  "reject_on"
  "release"
  "repeat"
  "restrict"
  "return"
  "rnmos"
  "rpmos"
  "rtran"
  "rtranif0"
  "rtranif1"
  "s_always"
  "s_eventually"
  "s_nexttime"
  "s_until"
  "s_until_with"
  "scalared"
  "sequence"
  "showcancelled"
  "small"
  "soft"
  "solve"
  "specify"
  "specparam"
  "static"
  "std"
  "strong"
  "strong0"
  "strong1"
  "struct"
  "supply0"
  "supply1"
  "sync_accept_on"
  "sync_reject_on"
  "table"
  "tagged"
  "task"
  "throughout"
  "timeprecision"
  "timeunit"
  "tran"
  "tranif0"
  "tranif1"
  "type"
  "typedef"
  "union"
  "unique"
  "unique0"
  "until"
  "until_with"
  "use"
  "var"
  "vectored"
  "virtual"
  "void'"
  "wait"
  "wait_order"
  "weak"
  "weak0"
  "weak1"
  "while"
  "wildcard"
  "with"
  "within"
  "xnor"
  "xor"
] @keyword

; Preprocessor
; ------------

[
  "`define"
  "`include"
  "`ifdef"
  "`ifndef"
  "`elsif"
  "`else"
  "`endif"
  "`undef"
  "`timescale"
  "`default_nettype"
  "`unconnected_drive"
  "`line"
  "`pragma"
  "`begin_keywords"
  "`__FILE__"
  "`__LINE__"
  (resetall_compiler_directive)
  (undefineall_compiler_directive)
  (celldefine_compiler_directive)
  (endcelldefine_compiler_directive)
  (nounconnected_drive_compiler_directive)
  (endkeywords_directive)
] @preproc

(text_macro_usage
  "`" @preproc
  .
  (simple_identifier) @preproc)

; Operators and punctuation
; -------------------------

[
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
  "&="
  "|="
  "^="
  "<<="
  ">>="
  "<<<="
  ">>>="
  "+"
  "-"
  "*"
  "/"
  "%"
  "**"
  "=="
  "!="
  "==="
  "!=="
  "==?"
  "!=?"
  "<"
  "<="
  ">"
  ">="
  "&&"
  "||"
  "!"
  "->"
  "<->"
  "~"
  "&"
  "~&"
  "|"
  "~|"
  "^"
  "~^"
  "^~"
  "<<"
  ">>"
  "<<<"
  ">>>"
  "++"
  "--"
  "?"
  "|->"
  "|=>"
  "#-#"
  "#=#"
  "->>"
  "@"
  "@@"
  "#"
  "##"
  "'"
  (unary_operator)
  (inc_or_dec_operator)
  (stream_operator)
] @operator

[
  ";"
  ","
  "."
  ":"
  "::"
  "+:"
  "-:"
  ":="
  ":/"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "'{"
  "(*"
  "*)"
] @punctuation.bracket
