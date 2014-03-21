# Maintainer: Luke McCarthy <luke@iogopro.co.uk>
pkgname=gosdcio
pkgver=0.73
pkgrel=1
pkgdesc="Command line utility to copy files to a GoSDC SD card file system"
arch=('i686' 'x86_64')
url="http://web.inter.nl.net/users/J.Kortink/home/hardware/gosdc/useful.htm"
license=(custom)
groups=()
depends=(glibc)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://web.inter.nl.net/users/J.Kortink/home/hardware/gosdc/gosdcsrc.zip")
noextract=()
md5sums=(e9427d05b35ae223594aea85429015bc)

build() {
  cd "$srcdir/$pkgname/src"

  make -f makefile.unx
}

package() {
  cd "$srcdir/$pkgname/src"

  install -D -m 755 gosdcio "$pkgdir/usr/bin/gosdcio"
  install -D -m 644 readme.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
