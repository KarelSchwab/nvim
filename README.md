sudo apt install python3 python3-pip xclip ripgrep

npm install -g neovim bash-language-server vscode-langservers-extracted dockerfile-language-server-nodejs emmet-ls sql-language-server svelte-language-server @tailwindcss/language-server typescript typescript-language-server @volar/vue-language-server cssmodules-language-server prettier lua-fmt @astrojs/language-server

pip3 install -U jedi-language-server

pip3 install pynvim

# Rust Analyzer
git clone https://github.com/rust-analyzer/rust-analyzer.git && cd rust-analyzer

cargo xtask install --server

# Lua Language Server
git clone https://github.com/sumneko/lua-language-server

cd lua-language-server

git submodule update --init --recursive

cd 3rd/luamake

./compile/install.sh

cd ../..

./3rd/luamake/luamake rebuild

# TODO
Formatter
rust-analyzer
Lua language-server
