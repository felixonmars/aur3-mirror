# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
# Contributor: Yann Kaiser <epsy nospace 46 at free dot fr>
# Contributor: Anton Golov <kdesevis at gmail dot com>
pkgname=vim-cfdg
pkgver=0.3
pkgrel=1
pkgdesc="Vim syntax files for Context Free Design Grammar (CFDG)"
arch=("any")
url="http://www.florianbrucker.de/index.php?p=cfdgsyntaxfile"
license=("custom:vim")
depends=("vim" "context-free" "imagemagick")
provides=("cfdg-vim=${pkgver}")
conflicts=("cfdg-vim")
options=()
source=("http://www.florianbrucker.de/content/cfdgsyntaxfile/cfdg.vim"
        "license.txt")
sha256sums=("3c8b05bb0eb6d303a0ae1949a0b7a5b5e4ba1334360e6b92baaaab08d591ab91"
            "4163d22093d02a2c3d973e89f102699d3f5e3a57cbe88d7c34571116052032fe")

build() {
  cd "$srcdir"

  sed -i "s/\(b:png_viewer\s\+=\s\+\)'.*'/\1'display'/" cfdg.vim
  sed -i "s/\(b:svg_viewer\s\+=\s\+\)'.*'/\1'display'/" cfdg.vim
}

package(){
  cd "$srcdir"
  
  install -m755 -d "${pkgdir}/usr/share/vim/vimfiles/"{ftdetect,syntax}
  install -m644 -t "${pkgdir}/usr/share/vim/vimfiles/syntax" cfdg.vim
  printf "%s\n" "au BufNewFile,BufRead *.cfdg set filetype=cfdg" >"${pkgdir}/usr/share/vim/vimfiles/ftdetect/cfdg.vim"

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" license.txt
}

# vim:set ts=2 sw=2 et:
