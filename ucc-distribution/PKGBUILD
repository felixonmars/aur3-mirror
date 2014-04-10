# Maintainer: Tomasz Żok <tomasz.zok[at]gmail.com>
pkgname=ucc-distribution
pkgver=7.0.1
pkgrel=1
pkgdesc="UNICORE is the latest Web Services-based, OGSA-compliant version of the UNICORE Grid middleware."
arch=(any)
url=http://www.unicore.eu/
license=(BSD)
depends=(java-runtime)
conflicts=(ucc)
source=("http://sourceforge.net/projects/unicore/files/Clients/Commandline%20Client/$pkgver/$pkgname-$pkgver-all.tar.gz")
md5sums=('461785ac44f07058c7268d44c4cf244f')

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
