# Maintainer: Tomasz Żok <tomasz.zok[at]gmail.com>
pkgname=ucc
pkgver=6.4.2
pkgrel=1
pkgdesc="UNICORE 6 is the latest Web Services-based, OGSA-compliant version of the UNICORE Grid middleware."
arch=(any)
url=http://www.unicore.eu/
license=(BSD)
depends=(java-runtime)
provides=(ucc)
source=("http://sourceforge.net/projects/unicore/files/2%20UNICORE%206%20Clients%2C%20Applications%2C%20and%20APIs/2.3%20Commandline%20Client%20(UCC)/$pkgver/$pkgname-$pkgver-all.tar.gz/download")
md5sums=('bc01a3876777aa802cb7e0031f3c78b3')

build() {
  true
}

check() {
  true
}

package() {
  mkdir -p "$pkgdir/opt/" "$pkgdir/usr/bin/"
  mv "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/"
  chmod +x "$pkgdir/opt/$pkgname-$pkgver/bin/ucc"

  script=$(mktemp)
  echo "#! /bin/sh" >> "$script"
  echo "exec /opt/$pkgname-$pkgver/bin/ucc \$@" >> "$script"
  install -m 755 $script "$pkgdir/usr/bin/ucc"
}

# vim:set ts=2 sw=2 et:
