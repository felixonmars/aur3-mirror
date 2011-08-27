# Contributor: Apkawa <apkawa@gmail.com>

pkgname=hunnyb
pkgver=0.1.0
pkgrel=3
pkgdesc="python library implements bencode encoding/decoding"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/HunnyB/0.1.0"
license=('GPL')
depends=('python2')
source=("http://meatballhat.com/attic/code/HunnyB/dist/HunnyB-${pkgver}.tar.gz" )

md5sums=('09dc336591fb6f16ab65cc2c5c5b5e70')

build() {
  cd $startdir/src/HunnyB-${pkgver}
python2 setup.py install --root=$startdir/pkg

}
