#Maintainer: Daniel Isenmann <daniel at archlinux dot org>
pkgname=wmfilebrowser
pkgver=0.1
pkgrel=1
pkgdesc="A file browser for Windowmaker using pipe menus."
depends=('python')
#optdepends=('xsel: to copy paths')
arch=('any')
license=('GPL')
url="http://ise.net23.net/?page_id=186"
source=(http://dev.archlinux.org/~daniel/wmfilebrowser/wmFilebrowser-${pkgver}.tar.gz)
md5sums=('922a14ee2188dc7849fad77c8383ca0e')

build() {
  mkdir -p ${pkgdir}/{usr/share/man/man1,/usr/bin}
  install -D -m644 $srcdir/wmFilebrowser/man/wmfilebrowser.1.gz $pkgdir/usr/share/man/man1/wmfilebrowser.1.gz
  install -D -m755 $srcdir/wmFilebrowser/wmFilebrowser $pkgdir/usr/bin/wmFilebrowser
}
# vim: set ts=2 sw=2 et:
