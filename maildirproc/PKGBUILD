# Maintainer: Mick Koch <kchmck@gmail.com>

pkgname="maildirproc"
pkgver="0.5.0"
pkgrel="1"
pkgdesc="Sorts mail based on a Python configuration file"
arch=("any")
url="http://joel.rosdahl.net/maildirproc/"
license=("GPL")
depends=("python")
source=("http://joel.rosdahl.net/maildirproc/releases/$pkgname-$pkgver.tar.bz2")
md5sums=("eaa001f6cd1befee99528ca55da979ca")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
