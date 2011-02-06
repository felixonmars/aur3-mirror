# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=watchpid
pkgver=0.1
pkgrel=2
pkgdesc="Wait for a process to die"
url="http://www.codepark.org"
license="GPL"
depends=('glibc')
makedepends=()
conflicts=()
replaces=()
backup=()
arch=('i686')
install=
source=(http://ftp.uni-erlangen.de/pub/Linux/gentoo/distfiles/${pkgname}_$pkgver.tar.gz)
md5sums=('954939f7ddf337d90ec9806abea0290b')


build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
