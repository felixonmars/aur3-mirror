pkgname=wspanish
pkgver=1.0.25
pkgrel=2
pkgdesc="The Spanish dictionary words for /usr/share/dict"
arch=('any')
url="http://packages.debian.org/stable/wspanish"
license=('unknown')
options=('zipman')
source=("http://ftp.de.debian.org/debian/pool/main/w/${pkgname}/${pkgname}_$pkgver.tar.gz")
md5sums=('4f8a44e172cd3e9cb8b2dde2e41d67f5')

build() {
  cd "$startdir/pkg"
  mkdir -p usr/share/dict
  mkdir -p usr/share/man/man5
  cd "$srcdir/$pkgname-$pkgver"
  cp -a words.spanish.latin1 $startdir/pkg/usr/share/dict/spanish
  cp -a words.5 $startdir/pkg/usr/share/man/man5/spanish.5
}
