
# Maintainer: Markus Blasl <markus.blasl@googlemail.com>
# Contributor: Markus Blasl <markus.blasl@googlemail.com>
pkgname=datapipe
pkgver=0.01
pkgrel=1
pkgdesc="It makes a data pipe between a listen port on the machine it's being run on and a port on a remote machine."
arch=('i686' 'x86_64')
url="http://user.cs.tu-berlin.de/~tqiu/exploits/datapipe.c"
license=('GPL')
groups=()
makedepends=('glibc' 'gcc-libs')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://user.cs.tu-berlin.de/~tqiu/exploits/datapipe.c)
noextract=()
md5sums=('a4bdca8de0fceb770f5e64834c12611c') #generate with 'makepkg -g'

build() {
  mkdir "$srcdir/$pkgname"
  mv datapipe.c "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"

  sed -i 's/.*linux\/time.h.*//' datapipe.c
  cc -o datapipe -O datapipe.c
  mkdir "$pkgdir/bin/"
  cp datapipe "$pkgdir/bin/"
}

# vim:set ts=2 sw=2 et:
