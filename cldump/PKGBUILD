#Note: This is sourced from Debian sid because the author doesn't host the code elsewhere (that I could find), is the Debian package maintainer, and has a Debian email address (jblache@debian.org).

# Author: Julien BLACHE <jb@jblache.org>

pkgname=cldump
pkgver=0.11~dfsg
pkgrel=1
pkgdesc="Clarion database files extractor"
arch=('any')
license=('GPL2')
url="https://packages.debian.org/sid/cldump"
source=(http://http.debian.net/debian/pool/main/c/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('ca1a8b8c1489ed4374a5dc9eea0b8fcd')

build() {
  cd $srcdir/$pkgname-$pkgver/src
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/$pkgname-$pkgver/src/$pkgname $pkgdir/usr/bin/
}
