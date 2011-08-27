# Contributor: lp76 <l.peduto@gmail.com>
# Contributor: Petr Novák <n_petr at seznam dot cz>

pkgname=vinagre-tweak
pkgver=288
pkgrel=1
pkgdesc="A VNC Client for the GNOME Desktop - scaling and ctrl+alt+ins (=ctrl+alt+del) support"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org/projects/vinagre/"
install=vinagre.install
conflicts=('vinagre')
depends=('gtk2>=2.12' 'libglade' 'gconf' 'gnome-keyring' 'gnutls' 'gtk-vnc-tune>=0.3.5' 'avahi')
makedepends=('gnome-doc-utils')
options=('!emptydirs')
source=(vinagre-ctrl_alt_del.patch)
md5sums=('cb7cca0fd0204b0025c23700f4bb9e87')
_svntrunk="http://svn.gnome.org/svn/vinagre/trunk"
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

  cd $startdir/src/trunk
  patch -Np1 -i ${startdir}/src/vinagre-ctrl_alt_del.patch || return 1

  cd $startdir/src/trunk
  ./autogen.sh --prefix=/usr
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  # ./configure --prefix=/usr --sysconfdir=/etc --disable-scrollkeeper \
  #	      --disable-schemas-install || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$startdir/pkg install || return 1
  install -d -m755 ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas \
  		     ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
  install -d $startdir/pkg/usr/share/pixmaps
  ln -fs /usr/share/icons/hicolor/48x48/apps/vinagre.png \
  $startdir/pkg/usr/share/pixmaps/vinagre.png
}
