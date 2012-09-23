# Maintainer: Santiago Piccinini <gringotumadre at gmail dot com>

pkgname=clam-networkeditor
pkgver=1.4.0
pkgrel=3
pkgdesc="tool for editing CLAM processing networks"
arch=('i686' 'x86_64')
url="http://clam-project.org"
license=('GPL')
depends=('clam>=1.4.0' 'qt' 'mesa')
makedepends=('scons')
source=(http://clam-project.org/download/src/NetworkEditor-${pkgver}.tar.gz
        networkeditor-fixes.diff)
md5sums=('79663504041b9f9ce21d0e382f23c6f9'
         '846d1e5c0bdec7b095635d780a4183ae')

build() {
  install -d $pkgdir/usr
  cd $srcdir/NetworkEditor-$pkgver
  patch -uNp1 -i ../networkeditor-fixes.diff
  QTDIR=/usr/lib/qt scons install prefix=$pkgdir/usr \
                    clam_prefix=/usr \
                    qt_plugins_install_path=/usr/lib/qt/plugins/designer \
                    release=1 verbose=1 

  mv $pkgdir/usr/usr/lib/qt/ $pkgdir/usr/lib/
  rmdir $pkgdir/usr/usr/lib $pkgdir/usr/usr
}
