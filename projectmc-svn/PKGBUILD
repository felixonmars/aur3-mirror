#Contributor: Stiletto <blasux@blasux.ru>
pkgname=projectmc-svn
pkgver=286
pkgrel=1
pkgdesc="A filemanager/shell that emulates Norton Commander. Fork by slavaz."
arch=('i686' 'x86_64')
provides=('mc' 'mc-utf8')
conflicts=('mc')
license=('GPL')
url="http://mc.redhat-club.org/"
depends=('e2fsprogs' 'glib2' 'pcre' 'gpm>=1.20.4' 'slang')
makedepends=('subversion' 'sed' 'libxt' 'libx11')
options=('!emptydirs' '!makeflags')
source=()
md5sums=()

_svntrunk=http://mc.redhat-club.org/svn/trunk
_svnmod=.

build() {
  cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
# Prevent lazy bindings in cons.saver binary.
#  - not using bindnow-flags() because cons.saver is only built on GNU/Linux
  sed -i -e "s:^\(cons_saver_LDADD = .*\):\1 -Wl,-z,now:" src/Makefile.in

  ./configure --prefix=/usr --mandir=/usr/share/man \
    --without-gnome --without-debug --with-screen=slang --without-included-gettext \
    --enable-largefile --with-subshell --with-edit --with-vfs --with-samba --with-mmap \
    --with-x --with-gpm-mouse --enable-charset
  make || return 1
  make DESTDIR=${pkgdir} install

}
