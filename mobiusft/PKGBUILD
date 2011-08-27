# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte*gmail>

pkgname=mobiusft
pkgver=0.5.6
pkgrel=0
pkgdesc="A forensic toolkit written in Python/GTK for managing cases and case items"
arch=('any')
url="http://savannah.nongnu.org/projects/$pkgname"
license=('GPL2')
depends=('python2' 'pygtk')
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=("6585f5660fd40077d16ab0a085a01ccb")

build() {
  cd $pkgname-$pkgver
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
  mv -f $pkgdir/usr/bin/mobius_bin.py $pkgdir/usr/bin/mobius_bin
}
