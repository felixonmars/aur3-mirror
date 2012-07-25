#
# Maintainer: Clemens Buchacher <drizzd@aon.at>
#
# You can use the newpkg script from
# https://github.com/drizzd/octave-forge-archlinux to automatically generate
# new octave-forge PKGBUILDs or update existing ones. Patches welcome.
#

_pack=sockets
pkgname=octave-$_pack
pkgver=1.0.8
pkgrel=1
pkgdesc="Socket functions for networking from within octave."
arch=(any)
url="http://octave.sourceforge.net/$_pack/"
license=('GPL3')
groups=('octave-forge')
depends=('octave>=2.9.10')
makedepends=()
optdepends=()
backup=()
options=()
install=$pkgname.install
_archive=$_pack-$pkgver.tar.gz
source=("http://downloads.sourceforge.net/octave/$_archive")
noextract=("$_archive")
md5sums=('5eec12500110bd4db2a2345b3316e6b5')

build() {
  cd "$srcdir"
  mkdir -p builddir
  octave -q -f --eval "pkg build -verbose -nodeps builddir $_archive"
}

package() {
  mkdir -p "$pkgdir/usr/share/octave/packages"
  mkdir -p "$pkgdir/usr/lib/octave/packages"
  cp "$srcdir/builddir/$_archive" "$pkgdir/usr/share/octave/$_pack.tar.gz"
}
