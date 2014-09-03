# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-cython-git
pkgver=20130603
pkgrel=1
pkgdesc="Vim syntax file for Cython"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/tshirtman/vim-cython"
license=('custom:vim')
source=(${pkgname%-git}::git+https://github.com/tshirtman/vim-cython)
sha256sums=('SKIP')
provides=('vim-cython')
conflicts=('vim-cython')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-cython/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftplugin plugin syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
