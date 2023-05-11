tag: user.lua
-

tag(): user.code_imperative

tag(): user.code_comment_line
tag(): user.code_comment_block
tag(): user.code_data_bool
tag(): user.code_data_null
tag(): user.code_functions
tag(): user.code_functions_common
tag(): user.code_libraries
tag(): user.code_libraries_gui
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_math
tag(): user.code_operators_pointer

# Use this tag if you use the stylua linter
tag(): user.stylua
# Add neovim specific lua language commands
tag(): user.nvim_lua
settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"

<user.operator> local: "local"
<user.operator> end: "end"
<user.operator> then: "then"
<user.operator> repeat: "repeat"
<user.operator> until: "until"
<user.operator> return (null | nil): "return nil"
<user.operator> return true: "return true"
<user.operator> return false: "return false"
<user.operator> return table: user.insert_between("return {", "}")
<user.operator> append string: " .. "

<user.operator> label <user.text>:
    insert("::")
    user.insert_formatted(text, "snake")
    insert("::")

require <user.code_libraries>:
    user.code_insert_library("", code_libraries)
    key(end enter)

<user.operator> (variable | var) [<user.text>] [over]: user.code_public_variable_formatter(text)

<user.operator> local (variable | var) [<user.text>] [over]:
    insert("local ")
    user.code_private_variable_formatter(text)

# for built in object methods, ex: foo:gsub()
method <user.text>:
    insert(":")
    user.code_public_function_formatter(text)
    insert("()")
    edit.left()

self dot: "self."

index <user.word>: '["{word}"]'
index (var | variable) <user.text>:
    var = user.formatted_text(text, "snake")
    insert("[{var}]")

<user.operator> return dick: user.insert_between("return {", "}")
