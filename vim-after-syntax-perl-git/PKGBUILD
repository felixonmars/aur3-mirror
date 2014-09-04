# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-after-syntax-perl-git
pkgver=20110706
pkgrel=1
pkgdesc="Extended syntax highlighting rules for Perl"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/trapd00r/vim-after-syntax-perl"
license=('BSD')
source=(git+https://github.com/trapd00r/vim-after-syntax-perl)
sha256sums=('SKIP')
provides=('vim-after-syntax-perl')
conflicts=('vim-after-syntax-perl')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-after-syntax-perl/README.md"

  msg 'Installing dirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _dir in after; do
    cp -dpr --no-preserve=ownership $_dir "$pkgdir/usr/share/vim/vimfiles/$_dir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
