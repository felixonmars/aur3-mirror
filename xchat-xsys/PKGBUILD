# Contributor: Nagy Gabor <ngaba@@bibl..u-szeged..hu>
pkgname=xchat-xsys
pkgver=2.2.0
pkgrel=4
pkgdesc="Sysinfo plugin for X-Chat"
url="http://dev.gentoo.org/~chainsaw/xsys"
depends=('xchat' 'pciutils' 'audacious')
arch=('i686' 'x86_64')
source=(http://dev.gentoo.org/~chainsaw/xsys/download/xsys-$pkgver.tar.bz2 xchat-xsys-archlinux.patch)
md5sums=('d57def00f96c7389ab593c009595f6f4' 'cb19b07831dee254f11ac148dbecb1cb')
license=('GPL')

build() {
  cd $srcdir/xsys-$pkgver
  sed -i -e "s:/usr/share/misc/:/usr/share/hwdata/:" Makefile
  sed -i -e "s:-O2 -Wall:${CFLAGS} -Wall:" Makefile
  sed -i -e "s:#BUTTON:BUTTON:" Makefile
  sed -i -e "s:# FOR AUDACIOUS # ::g" Makefile
  patch -Np1 -i $srcdir/xchat-xsys-archlinux.patch
  make
  mkdir -p $pkgdir/usr/lib/xchat/plugins
  cp xsys-$pkgver.so $pkgdir/usr/lib/xchat/plugins
}
