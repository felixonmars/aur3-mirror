# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Andeas W. Hauser <andy-aur@splashground.de>

pkgname=sgrep
pkgver=1.94a
pkgrel=1
pkgdesc="Structured GREP, for filtering based on structural criteria (for SGML,XML and HTML)"
arch=(i686 x86_64)
url="http://www.cs.helsinki.fi/u/jjaakkol/sgrep.html"
license=('GPL')
depends=('glibc')
source=("ftp://ftp.cs.helsinki.fi/pub/Software/Local/Sgrep/$pkgname-$pkgver.tar.gz")
md5sums=('8cdd044602061b0ecd3e610fde655a3f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --datadir=/usr/share/$pkgname \
              --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
