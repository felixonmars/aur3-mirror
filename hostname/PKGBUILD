pkgname=hostname
pkgver=3.15
pkgrel=1
pkgdesc="Utility to set/show the host name or domain name"
arch=('i686' 'x86_64')
url="http://packages.qa.debian.org/h/hostname.html"
license=('GPL2')
depends=('glibc')
options=('!emptydirs')
source=("http://ftp.de.debian.org/debian/pool/main/h/$pkgname/hostname_$pkgver.tar.gz")
md5sums=('f93c87de2517850de5f47234e3bcb563')
sha256sums=('b6d10114ed14306b21745d2cac1b9adf7a2546f16b9fd719bec14bd7cec61d20')

build() {
  cd "$srcdir/$pkgname"
  make CC="${CC:-gcc}"
}

package() {
  cd "$srcdir/$pkgname"
  make BASEDIR="$pkgdir" install
  mv "$pkgdir/bin" "$pkgdir/usr/bin"
}
