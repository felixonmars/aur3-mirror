# Contributor: Li Dongyang<Jerry87905@gmail.com>

pkgname=bluez-python
pkgver=0.1.4
pkgrel=1
pkgdesc="A BlueZ python binding on top of dbus-python"
arch=(i686 x86_64)
url="http://code.google.com/p/bluez-python"
license=('LGPL')
depends=('bluez>=4.30' 'dbus-python')
source=(http://bluez-python.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('013f283d3c32765e67c89ebf7f5470ea')

build() {
  cd $startdir/src/$pkgname
  python setup.py install --root=$startdir/pkg
}
