# Maintainer: Gary van der Merwe <garyvdm@gmail.com>

pkgname=nautilus-image-manipulator
pkgver=1.3
pkgrel=2
pkgdesc="Resize and send images from Nautilus"
arch=('i686' 'x86_64')
url="https://launchpad.net/nautilus-image-manipulator"
license=('GPL-3')
depends=('python2' 'nautilus>=3.0.0' 'python-nautilus' 'pyexiv2' 'python-imaging')
makedepends=('python2' 'python2-distutils-extra>=2.32')
install=$pkgname.install
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz 
        pillow_import_fix.patch)
md5sums=(064fe2c1d6ddae59dc22cbed425d9add
         882ee351b8dc6cc79335c696e2c24d23)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i $srcdir/pillow_import_fix.patch 
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
