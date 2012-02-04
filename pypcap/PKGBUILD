# Contributor: Michael P <ptchinster@archlinux.us>
pkgname=pypcap
pkgver=1.1
pkgrel=4
pkgdesc="Python extension module for libpcap."
url="http://code.google.com/p/pypcap/"
license=('custom')
arch=('any')
depends=('python' 'libpcap')
makedepends=()
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('034c3cbbfa81aa19e8f685b767c65764')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py config
  python setup.py build
  python setup.py install --root=$startdir/pkg
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname/
  cp $startdir/src/$pkgname-$pkgver/LICENSE $startdir/pkg/usr/share/licenses/$pkgname/
}

