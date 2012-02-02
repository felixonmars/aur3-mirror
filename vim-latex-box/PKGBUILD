# Maintainer: Raymond Wagenmaker <raymondwagenmaker at gmail dot com>
pkgname=vim-latex-box
pkgver=0.9.5
pkgrel=1
pkgdesc="Lightweight Toolbox for LaTeX"
arch=('any')
url="https://launchpad.net/vim-latex-box"
license=('GPL3')
depends=('vim>=7.3')
optdepends=('texlive-core: background compilation support using latexmk')
install=vimdoc.install
source=('LatexBox.vmb::http://www.vim.org/scripts/download_script.php?src_id=16732')
noextract=("LatexBox.vmb")
md5sums=('7d64e62a3aebe3010b2494999698a2aa')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/vim/vimfiles/ftplugin"
  install -d "$pkgdir/usr/share/vim/vimfiles/doc"
  vim -c "UseVimball $pkgdir/usr/share/vim/vimfiles" -c "q" LatexBox.vmb
  rm "$pkgdir/usr/share/vim/vimfiles/doc/tags"
  rm "$pkgdir/usr/share/vim/vimfiles/.VimballRecord"
}

# vim:set ts=2 sw=2 et:
