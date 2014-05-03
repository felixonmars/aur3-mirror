# Maintainer: Ray Griffin <rorgoroth@gmail.com>

pkgname=rpm2targz
pkgver=9.0.0.5g
pkgrel=1
pkgdesc="Convert a .rpm file to a .tar.gz archive - Gentoo maintained version"
url="http://www.slackware.com/config/packages.php"
arch=('any')
license=('BSD-1')
source=('http://mirror.qubenet.net/mirror/gentoo/distfiles/rpm2targz-9.0.0.5g.tar.xz')
md5sums=('5773c259dcbfc0061401b87261437903')
depends=('cpio' 'gzip' 'tar' 'xz')

build() {
  cd "$pkgname-$pkgver"
  
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -m755 -d "${pkgdir}/usr/share/doc/rpm2targz"
  install -m655 rpm2targz.README "$pkgdir/usr/share/doc/rpm2targz/"
  install -m655 rpm2targz.README.Gentoo "$pkgdir/usr/share/doc/rpm2targz/"
}
