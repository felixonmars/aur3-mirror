# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=python-audio-tools
pkgver=2.15
pkgrel=1
pkgdesc="Collection of audio handling programs which work from the command line"
arch=('i686' 'x86_64')
url="http://audiotools.sourceforge.net/"
license=('GPL2')
depends=('libcdio' 'python')
source=(http://downloads.sourceforge.net/project/audiotools/audiotools/2.15/audiotools-$pkgver.tar.gz)
md5sums=('d3282d4c4298c809b61ea16c33a52241')

build() {
  cd $srcdir/audiotools-$pkgver

  python setup.py install --root $pkgdir
}
