# Maintainer: Viktor Semykin <thesame.ml@gmail.com>
pkgname=deadbeef-static
pkgver=0.6.2
pkgrel=1
_pkgrel=1
pkgdesc="Ultimate Music Player For GNU/Linux. Official static build"
arch=('i686' 'x86_64')
url="http://deadbeef.sf.net/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)

if test $CARCH == x86_64; then
md5sums=('b36cf4fbcdc93c5d838df702137be5aa')
else
md5sums=('38037d0bb14d37dc4254f905c943485e')
fi

source=("http://sourceforge.net/projects/deadbeef/files/deadbeef-static_${pkgver}-${_pkgrel}_${CARCH}.tar.bz2")

package() {
    mkdir -p "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/bin"

    cp -r "$srcdir/deadbeef-$pkgver" "$pkgdir/opt/deadbeef"
    echo -e "#!/bin/sh\n\n/opt/deadbeef/deadbeef" > "$pkgdir/usr/bin/deadbeef"
    chmod +x "$pkgdir/usr/bin/deadbeef"
}
