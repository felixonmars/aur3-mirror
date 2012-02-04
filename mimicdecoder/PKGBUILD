# Contributor: Robin Martinjak <rob@kingofnerds.net>
pkgname=mimicdecoder
pkgver=1.0.1.1
pkgrel=1
pkgdesc="GUI for mimic2rgb helping the user convert amsn webcam streams 
to raw video or xvid"
arch=('i686' 'x86_64')
url="http://thegraveyard.org"
license=('GPL')
depends=('python' 'pyqt3' 'mimictools')
optdepends=('transcode: directly convert to xvid')
options=('!emptydirs')
source=(http://thegraveyard.org/files/$pkgname-$pkgver.tar.gz)
md5sums=('2bb2ccfb755419770fb497c717a1fd1f')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/
  }

# vim:set ts=2 sw=2 et:
