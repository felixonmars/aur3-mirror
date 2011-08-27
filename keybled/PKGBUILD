# Contributor: vn158 <vn158 at seznam dot cz>

pkgname=keybled
pkgver=0.65
pkgrel=3
pkgdesc="KeybLED is a Panel applet which displays a keyboard's LED status"
url="http://keybled.aurel32.net/"
arch=(i686 x86_64)
depends=('kdelibs>=3.0')
makedepends=('kdesdk')
license=('GPL')
source=(http://keybled.aurel32.net/keybled/keybled-$pkgver.tar.gz)
md5sums=('68be43b92e2dd45faf5034dccfac2842')

build() {
  cd $startdir/src/$pkgname-$pkgver
  cp -f keybled/Makefile.in keybled/Makefile.in.old
  sed "s/\@CPPFLAGS\@/\@CPPFLAGS\@ \-DQT\_CLEAN\_NAMESPACE/" keybled/Makefile.in.old >keybled/Makefile.in
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
	