# $Id:$
# Maintainer: <fero dot kiraly at gmail.com>

pkgname=puredata-utils
pkgver=0.46.6
_ver=${pkgver%.*}-${pkgver##*.}
pkgrel=1
pkgdesc="pdsend and pdreceive for Pure Data"
arch=('i686' 'x86_64')
url="http://crca.ucsd.edu/~msp/software.html"
license=('custom:BSD')
optdepends=('pd-vanilla' 'pd-extended')
source=("http://msp.ucsd.edu/Software/pd-$_ver.src.tar.gz")
md5sums=('341649683c1ff3902e1578f7eae99272')



build() {
  cd "$srcdir/pd-$_ver/src"
  gcc -o pdsend u_pdsend.c
  gcc -o pdreceive u_pdreceive.c
}

package() {
  install -Dm755 "$srcdir/pd-$_ver/src/pdsend"      "$pkgdir/usr/bin/pdsend"
  install -Dm755 "$srcdir/pd-$_ver/src/pdreceive"   "$pkgdir/usr/bin/pdreceive"
  install -Dm644 "$srcdir/pd-$_ver/man/pdsend.1"    "$pkgdir/usr/man/man1/pdsend.1"
  install -Dm644 "$srcdir/pd-$_ver/man/pdreceive.1" "$pkgdir/usr/man/man1/pdreceive.1"
  install -Dm644 "$srcdir/pd-$_ver/LICENSE.txt"     "$pkgdir/usr/share/licenses/pd-utils/LICENSE"
}

