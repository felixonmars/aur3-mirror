# Contributor: David Ell <david at bytesizebits dot net>

pkgname=linuxdoc-tools
pkgver=0.9.66
pkgrel=1
pkgdesc="Convert LinuxDoc SGML source into other formats"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/linuxdoc-tools"
license=('GPL')
depends=(jade)
source=(http://ftp.de.debian.org/debian/pool/main/l/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('f214e79b0dd084689cd04f18722bd563')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}
