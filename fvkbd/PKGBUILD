# Contributor: Feufochmar <feufochmar.gd@gmail.com>
pkgname=fvkbd
pkgver=0.2.2
pkgrel=4
pkgdesc="A free and flexible Virtual Keyboard aiming at providing fancy UI and easy to config layout"
arch=('i686' 'x86_64')
url="http://gitorious.org/fvkbd/pages/Home"
license=('LGPL')
depends=('gtk2' 'libxml2' 'libfakekey' 'libunique')
makedepends=('git')
source=( http://gitorious.org/$pkgname/$pkgname/archive-tarball/$pkgver )
 
build() {
  cd $srcdir/fvkbd-fvkbd
  # remove the -Werror flag
  # there are some variables not used as we don't compile with debug support
  find * -name "Makefile.am" | xargs grep -l Werror | xargs sed -i s/-Werror//g
  #
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  
  make
}
 
package() {
  cd $srcdir/fvkbd-fvkbd
  make DESTDIR=$pkgdir install
}
md5sums=('39a6747efab25737de0d603a1e91630f')
