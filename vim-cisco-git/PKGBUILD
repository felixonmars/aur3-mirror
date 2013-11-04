pkgname=vim-cisco-git
pkgver=211.2a935825fb6c754
pkgrel=1
pkgdesc="Vim syntax highlighting for Cisco configuration, Cisco ASA firewall and Cisco ACL files"
arch=("any")
url="http://www.vim.org/"
license=("custom")
depends=("vim")
makedepends=("git")
options=("emptydirs")
source=("cisco.vim::git://github.com/vim-scripts/cisco.vim.git"
        "ciscoacl.vim::git://github.com/vim-scripts/ciscoacl.vim.git"
        "ciscoasa.vim::git://github.com/vim-scripts/ciscoasa.vim.git"
       )
md5sums=("SKIP"
         "SKIP"
         "SKIP"
        )
pkgver() {
  cd "${srcdir}/cisco.vim"
  _ciscoverc=$(git rev-list  --count HEAD)
  _ciscovers=$(git rev-parse --short HEAD)
  cd "${srcdir}/ciscoacl.vim"
  _ciscoaclverc=$(git rev-list  --count HEAD)
  _ciscoaclvers=$(git rev-parse --short HEAD)
  cd "${srcdir}/ciscoasa.vim"
  _ciscoasaverc=$(git rev-list  --count HEAD)
  _ciscoasavers=$(git rev-parse --short HEAD)
  echo "${_ciscoverc}${_ciscoaclverc}${_ciscoasaverc}.${_ciscoverc}${_ciscoaclvers}${_ciscoasavers}"
}
prepare(){
cat << EOL > "$srcdir/ftdetect-ciscoacl.vim"
augroup filetype 
  au! BufRead,BufNewFile *.acl   set filetype=ciscoacl
augroup END
EOL
}
package() {
  sed -i "s/let b:current_syntax = \"cisco\"/let b:current_syntax = \"ciscoacl\"/g" "$srcdir/ciscoacl.vim/syntax/ciscoacl.vim"
  install -Dm644 "$srcdir/cisco.vim/syntax/cisco.vim"       "$pkgdir/usr/share/vim/vimfiles/syntax/cisco.vim"
  install -Dm644 "$srcdir/ciscoacl.vim/syntax/ciscoacl.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/ciscoacl.vim"
  install -Dm644 "$srcdir/ciscoasa.vim/syntax/ciscoasa.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/ciscoasa.vim"
  install -Dm644 "$srcdir/ftdetect-ciscoacl.vim"            "$pkgdir/usr/share/vim/vimfiles/ftdetect/ciscoacl.vim"
} 
