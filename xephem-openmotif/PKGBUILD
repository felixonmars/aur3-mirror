# Based on: Bruno Tsubouchi Yporti <yportimd at gmail.com>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
# Contributor: Thomas Dziedzic

pkgname=xephem-openmotif
_pkgname=xephem
pkgver=3.7.4
pkgrel=1
pkgdesc='The Serious Interactive Astronomical Software Ephemeris.'
url='http://www.clearskyinstitute.com/xephem/xephem.html'
license='custom'
depends=('libxp' 'libxmu')
makedepends=('openmotif')
conflicts=('xephem')
provides=('xephem')
arch=('i686' 'x86_64')
source=("http://97.74.56.125/free/$_pkgname-$pkgver.tar.gz"
        'xephem-ldflags.diff'
        'license.txt')
md5sums=('4e9290609f36df469a2ba5a1b4fffd46'
         'b78b195f81e7d8010175a76f75f56928'
         '31aeaa879db86feee457c3b6d4dc4a1f')

build() {
  cd $_pkgname-$pkgver/GUI/$_pkgname

  patch -p3 -i "$srcdir/xephem-ldflags.diff"
  make -j1 MOTIF=/usr/lib/ || return 1

  mkdir -p "$pkgdir/usr/share/$_pkgname"
  for i in auxil catalogs fifos fits gallery help lo
  do
    cp -R $i "$pkgdir/usr/share/$_pkgname/"
  done

  mkdir -p "$pkgdir/usr/lib/X11/app-defaults"
  echo "XEphem.ShareDir: /usr/share/xephem" > "$pkgdir/usr/lib/X11/app-defaults/XEphem"

  install -D -m755 xephem "$pkgdir/usr/bin/xephem"
  install -D -m644 xephem.1 "$pkgdir/usr/man/man1/xephem.1"
  install -D -m644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/custom/$_pkgname/license.txt"
}
