# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-colors-nefertiti
pkgver=2.0.0
_srcid=22081
pkgrel=1
pkgdesc="A warm dark-background color scheme for GVim (previously known as MochaLatte), featuring dynamic control of brightness levels as needed."
arch=('any')
depends=('vim')
groups=('vim-plugins')
url="http://www.vim.org/scripts/script.php?script_id=4967"
license=('BSD')
source=($pkgname.tar.gz::http://www.vim.org/scripts/download_script.php?src_id=$_srcid)
sha256sums=('80af494a7ae571b3aed7c9a3e4ec57497cd49a03f93c2d00ae34a925cedf870b')
install=nefertiti.install

package() {
  cd "$srcdir/vim-nefertiti"

  msg 'Installing documentation...'
  install -Dm 755 README.md "$pkgdir/usr/share/doc/vim-colors-nefertiti/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in colors doc; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done
}
