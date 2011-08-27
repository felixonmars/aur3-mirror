# Maintainer: Peter B. Jørgensen <peterbjorgensen@gmail.com>
# Contributor: Evan Gates <evan.gates at gmail dot com>
# Contributor: Vardyr <vardyr.al at insocada dot com>

pkgname=woof-python3
pkgver=20091227
_pkgver='2009-12-27'
_pkgname='woof'
pkgrel=3
pkgdesc='An ad-hoc single file webserver; Web Offer One File - Patched for python 3 support'
arch=('any')
url='http://www.home.unix-ag.org/simon/woof.html'
license=('GPL')
depends=('python')
conflicts=('woof')
provides=('woof')
replaces=('woof')
source=("http://www.home.unix-ag.org/simon/$_pkgname-$_pkgver.py"
        "woof-python3.patch"
        "woof-nofork.patch")
md5sums=('4df770eedef7b011fc37d42015c801b9'
         '5e9e01f7be55377ca9f1d3e0602fdc42'
         '7fa012fb075c0bff717a674c01e04d16')

build() {
  cd "$srcdir"
  patch -p1 -i ../woof-python3.patch
  patch -p0 -i ../woof-nofork.patch
}

package() {
  cd "$srcdir"
  install -D -m755 "$_pkgname-$_pkgver.py" "$pkgdir/usr/bin/$_pkgname"
}
