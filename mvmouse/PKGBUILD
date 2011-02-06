# Contributor: Andreas Baumann <abaumann@yahoo.com>

pkgname=mvmouse
pkgver=latest
pkgrel=1
pkgdesc="A tool to move the mouse of X in shell scripts."
arch=('i686' 'x86_64')
url="http://hocwp.free.fr/movemouse.html"
license="GPL"
depends=()
source=(http://hocwp.free.fr/$pkgname.tar.gz)
md5sums=('028b70b4a2adfcc1ee00468bbda5a8ab')

build() {
  cd $srcdir/$pkgname
  make || return 1
  install -d 755 $pkgdir/usr/bin || return 1
  make DEST=$pkgdir/usr/bin install || return 1
}
