# Contributor: Bence Balint <balintbence1337@gmail.com>
pkgname=python2-utidylib
pkgver=0.2
pkgrel=1
pkgdesc="Python bindings for Tidy HTML parser/cleaner."
arch=('i686' 'x86_64')
url="http://utidylib.berlios.de"
license=('MIT')
depends=('tidyhtml' 'python2>=2.5')
source=("http://download.berlios.de/utidylib/uTidylib-$pkgver.zip")
md5sums=('c9f16988f92ef660f46523192ef37462')

build() {
  cd $startdir/src/uTidylib-$pkgver
  python2 setup.py install --root=$startdir/pkg || return 1
  install -m644 -D LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
