pkgname=kidentd-git
pkgver=20100511
pkgrel=3
pkgdesc="Simple ident daemon. Ident daemons are commonly used for IRC official identification and other services."
arch=('i686' 'x86_64')
url="http://www.exdevelopment.net"
license=('GPL3')
makedepends=('git' 'cmake')
provides=('kidentd')

_gitroot="git://github.com/kevr/kidentd.git"
_gitname="kidentd"

build() {
   cd "$srcdir"
   msg "Connecting to GIT server...."

   if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
   else
      git clone $_gitroot $_gitname
   fi

   msg "GIT checkout done or server timeout"
   msg "Starting make..."

   rm -rf "$srcdir/$_gitname-build"
   git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
   cd "$srcdir/$_gitname-build/src"

   cmake . -DPREFIX=${pkgdir}/usr
   make || return 1
   make install
   install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
   install -Dm644 rc/kidentd.conf ${pkgdir}/etc/kidentd.conf
   install -Dm755 rc/kidentd ${pkgdir}/etc/rc.d/kidentd
} 
