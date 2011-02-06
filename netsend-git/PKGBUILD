# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
pkgname=netsend-git
pkgver=20080903
pkgrel=2
pkgdesc="A file transfer and network diagnostic tool"
url="http://netsend.berlios.de"
license=('GPL2')
source=()
md5sums=()
arch=('i686')
depends=()
makedepends=(git)

_gitroot="git://git.berlios.de/netsend"
_gitname="netsend"

build() {
   cd "$srcdir"
   msg "Connecting to GIT server...."

   if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
   else
      git clone $_gitroot
   fi

   msg "GIT checkout done or server timeout"
   msg "Starting make..."

   rm -r "$srcdir/$_gitname-build"
   cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
   cd "$srcdir/$_gitname-build"

   ./configure --prefix=/usr
   make || return 1
   mkdir $pkgdir/bin
   make DESTDIR="$pkgdir" install
}
