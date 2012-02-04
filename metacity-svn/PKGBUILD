# Contributor: Matteo Ilgufo <theowlnet@gmail.com>

pkgname=metacity-svn
_realname=metacity
pkgver=3661
pkgrel=1
pkgdesc="A window manager for GNOME2 - svn version"
arch=('i686' 'x86_64')
license=('GPL')
depends=('startup-notification>=0.9' 'gconf>=2.19.1')
makedepends=('perlxml' 'pkgconfig' 'subversion' 'gnome-common' 'intltool')
provides=('metacity')
replaces=('metacity')
conflicts=('metacity')
url="http://www.gnome.org"
groups=('gnome')
options=('!libtool' '!emptydirs')
install=metacity-svn.install
source=()
md5sums=()

_svnmod="metacity-svn"
_svntrunk="http://svn.gnome.org/svn/metacity/trunk"

build() {
  cd $startdir/src
  msg "Connecting to svn.gnome.org svn server...."
  svn co $_svntrunk $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $startdir/src/$_svnmod
  
  ./autogen.sh --prefix=/usr --enable-compositor \
  						--sysconfdir=/etc --libexecdir=/usr/lib/metacity \
              --localstatedir=/var --disable-static \

  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/metacity.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
