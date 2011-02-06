# Contributor: pressh <pressh at gmail dot com>
# Contributor: Petr Novák <n_petr at seznam dot cz>

pkgname=gnome-main-menu-svn-lite
pkgver=442
pkgrel=2
pkgdesc="Novell SLED Gnome main-menu applet - without gnome-screensaver"
url="http://www.novell.com/"
license=('GPL')
depends=('glib2' 'gtk-doc' 'libgnome' 'gnome-panel' 'libgtop' 'dbus-sharp' 'networkmanager-beta' 'hal' 'wireless_tools' 'gnome-menus' 'avahi' 'libbeagle' 'libgail-gnome') 
makedepends=('intltool' 'pkgconfig' 'subversion' 'gnome-common' 'versionpkg' 'beagle')
install=gnome-main-menu.install
arch=('i686' 'x86_64')
source=()
md5sums=()
_svntrunk="http://svn.gnome.org/svn/gnome-main-menu/trunk"
_svnmod="trunk"


build() {
  cd $startdir/src

    if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/usr/etc/gconf/schemas/*.schemas
  rm -rf ${startdir}/pkg/usr/etc/gconf/schemas

  rm -rf $startdir/src/$_svnmod-build
}
