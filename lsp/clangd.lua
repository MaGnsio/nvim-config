return {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose", "--header-insertion=never" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", ".git" },
  init_options = {
    fallbackFlags = { "-std=c++20" },
  },
}
