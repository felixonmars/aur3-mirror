# Maintainer: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>
pkgname=vim-nucolors
pkgver=1.0
pkgrel=1
pkgdesc="A colorful dark scheme with bright pastel colors "
arch=(any)
url="http://dotshare.it/dots/6/"
license=('unknown')
depends=(vim)
source=('http://dotshare.it/dots/6/0/raw')
md5sums=('11984863d1240da1c462fe34e98a9ba2')

package() {
  cd "$srcdir"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -D -m644 raw  $_installpath/colors/nucolors.vim
}
