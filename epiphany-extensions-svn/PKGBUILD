# Contributor: Manuel Mazzuola <origin.of@gmail.com>
pkgname=epiphany-extensions-svn
pkgver=1712
pkgrel=1
pkgdesc="Various extentions for the Epiphany web browser"
url="http://www.gnome.org/projects/epiphany/"
license=('GPL')
depends=('epiphany-svn' 'python>=2.5' 'opensp')
makedepends=('pkgconfig' 'gnome-doc-utils>=0.12.2')
options=('!libtool' '!emptydirs')
arch=(i686 x86_64)
provides=('epiphany-extensions')
conflicts=('epiphany-extensions')
install=epiphany-extensions.install
source=()
md5sums=()

_svnmod="epiphany-extensions"
_svntrunk="http://svn.gnome.org/svn/epiphany-extensions/trunk"

build() {

  cd $startdir/src
  msg "Connecting to svn.gnome.org svn server...."
  svn co $_svntrunk $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $startdir/src/$_svnmod
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-extensions=all --disable-scrollkeeper || return 1
  ./configure  --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-extensions=all --disable-scrollkeeper || return 1
  make LDFLAGS+="-R /usr/lib/xulrunner" || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install
  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/epiphany-extensions.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
