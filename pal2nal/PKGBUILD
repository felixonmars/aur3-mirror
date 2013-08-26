# Contributor: Mick Elliot <micke@sfu.ca>

pkgname=pal2nal
pkgver=14
pkgrel=1
pkgdesc="robust conversion of protein sequence alignments into the corresponding codon alignments"
arch=(i686 x86_64)
url="http://www.bork.embl.de/pal2nal"
license=('GPL')
depends=('perl')
source=(${url}/distribution/pal2nal.v${pkgver}.tar.gz)
md5sums=('cf8b2b9aaa7dce740a81454cf8136ba1')


package() {
  cd "$srcdir/$pkgname.v$pkgver"
  install -D -m755 pal2nal.pl $pkgdir/usr/bin/pal2nal.pl
}
 
