# Plugin manager
source "%val{config}/plugins/plug.kak/rc/plug.kak"
plug "andreyorst/plug.kak" noload
# Plugins
plug "andreyorst/fzf.kak"
plug "https://gitlab.com/Screwtapello/kakoune-cargo"

# Let's see what my fingers do
set-option global autoinfo command|onkey|normal

# LSP
plug "kak-lsp/kak-lsp" do %{
  cargo install --locked --force --path .
  mkdir -p ~/.config/kak-lsp
  cp -n kak-lsp.toml ~/.config/kak-lsp/
}

hook global WinSetOption filetype=rust %{
  set-option window formatcmd 'rustfmt'
  lsp-enable-window
  # Cargo
  map -docstring "Cargo" global user m ':enter-user-mode cargo<ret>'
  map -docstring "Run clippy" global cargo C %{: cargo clippy<ret>}

}

hook global WinSetOption filetype=(c|cpp) %{
  lsp-enable-window
  set window formatcmd clang-format
  map -docstring "Make" global user m ':make<ret>'
}

hook global WinSetOption filetype=(html|htm|xml) %{
  set-option window formatcmd 'tidy -i'
}

# Custom key mappings

# Paste from global clipboard (like vim 'P' and 'p')
map -docstring "Paste before" global user P '!xsel -b -o<ret>'
map -docstring "Paste after" global user p '<a-!>xsel -b -o<ret>'

# Find/Open file
map -docstring "fzf-mode" global user f ':fzf-mode<ret>'

# LSP
map -docstring "LSP" global user l ':enter-user-mode lsp<ret>'

# Comment lines
map -docstring "Comment line" global user c ':comment-line<ret>'
map -docstring "Comment line" global user C ':comment-block<ret>'

# Case insensitive search
map -docstring 'case insensitive search' global user / '/(?i)'
map -docstring 'case insensitive backward search' global user <a-/> '<a-/>(?i)'
map -docstring 'case insensitive extend search' global user ? '?(?i)'
map -docstring 'case insensitive backward extend-search' global user <a-?> '<a-?>(?i)'

# Convenient shortcuts for when a "quick session" turns into something bigger
map -docstring 'rename to session 1' global user <F1> ':rename-session 1<ret>'
map -docstring 'rename to session 2' global user <F2> ':rename-session 2<ret>'
map -docstring 'rename to session 3' global user <F3> ':rename-session 3<ret>'
map -docstring 'rename to session 4' global user <F4> ':rename-session 4<ret>'
map -docstring 'rename to session 5' global user <F5> ':rename-session 5<ret>'


# Indentation
set-option global tabstop 2
set-option global indentwidth 2

# Copy to global clipboard on each 'y', 'd', 'c' selection
hook global NormalKey y|d|c %{ nop %sh{
  printf %s "$kak_reg_dquote" | xsel --input --clipboard
}}

# Enable autowrapping for emails
hook -group mail-wrap global WinSetOption filetype=mail %{
    autowrap-enable
    set buffer autowrap_format_paragraph true
}

# Show line numbers
add-highlighter global/ number-lines

colorscheme kaleidoscope-light-mod
