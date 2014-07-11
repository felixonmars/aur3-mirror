# Contributor: test0
pkgname=gzsteg
pkgdesc='A new option is added to gzip 1.2.4, "-s" or "--steg", that provides for the
hiding/revealing of files. You hide files during compression and
reveal them during decompression. Binary installed as gzsteg to avoid conflict with gzip.'
pkgver=1.2.4
pkgrel=1
arch=(any)
url='http://dl.packetstormsecurity.net/crypt/stego/gzipsteg'
license=('GPL2')
depends=('bash' 'glibc' 'less')
source=("http://dl.packetstormsecurity.net/crypt/stego/gzipsteg/gzip-1.2.4steg.tar.gz")
sha256sums=('12135151d847780c5e64c326331bb5b7bb79184f8de0f158a04855b7750756b4')

build() {
  cd "$srcdir/gzip-$pkgver"
	./configure
   make
   }

check() {
  cd "$srcdir/gzip-$pkgver"
  make -k check
}

package() {
  install -D -m755 "$srcdir/gzip-$pkgver/gzip" ${pkgdir}/usr/bin/gzsteg
  install -D -m644 "$srcdir/gzip-$pkgver/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
