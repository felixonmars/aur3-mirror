# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>
pkgname=unity2d-bzr
pkgver=631
pkgrel=1
pkgdesc="unity-2d project is a 2d implementation of Unity"
arch=('i686' 'x86_64')
url="http://launchpad.net/unity-2d"
license=('GPL')
depends=('qt' 'libwnck' 'libdbusmenu-qt' 'libindicator' 'libqtbamf-bzr' 'libqtdee-bzr' 'utouch-geis-bzr'
	 'libqtgconf-bzr' 'metacity' 'unity-place-files-bzr' 'unity-place-applications-bzr' 'unity-asset-pool-bzr')
makedepends=('cmake' 'bzr')
optdepends=('appmenu-gtk: Export GTK menus over DBus'
	    'appmenu-qt: appmenu support for Qt')
source=(gio.patch
	01_build_with_new_indicator.patch)
conflicts=('unity-2d')
replaces=('unity-2d')
groups=('unity2d-bzr')
install=unity2d-bzr.install
md5sums=('f42c84e51214befe58357a0bd861c806'
         '2e10f7e2eb7b4294f07357d60aefdad4')


_bzrtrunk=lp:unity-2d
_bzrmod=unity-2d

build() {
  cd "$srcdir"
  if [ -d ${_bzrmod} ]; then
  bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi
  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."
  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build 
  fi
  bzr clone ${srcdir}/${_bzrmod} ${srcdir}/build
  cd ${srcdir}/build
  patch -Np1 -i "$srcdir/gio.patch"
  patch -Np1 -i "$srcdir/01_build_with_new_indicator.patch"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

 package() { 
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
  install -D -m 755 ${srcdir}/${_bzrmod}/debian/unity-2d.py ${pkgdir}/usr/share/apport/general-hooks/unity-2d.py
  install -D -m 644 ${srcdir}/${_bzrmod}/debian/gconf/unity-2d.default.path ${pkgdir}/usr/share/gconf/unity-2d.default.path
  install -D -m 644 ${srcdir}/${_bzrmod}/debian/gconf/unity-2d.mandatory.path ${pkgdir}/usr/share/gconf/unity-2d.mandatory.path
  install -D -m 644 ${srcdir}/${_bzrmod}/debian/gconf/schemas/unity-2d.schemas ${pkgdir}/usr/share/gconf/schemas/unity2d-bzr.schemas
  install -D -m 644 ${srcdir}/${_bzrmod}/session/2d-ubuntu.session ${pkgdir}/usr/share/gnome-session/sessions/2d-ubuntu.sessions
  install -D -m 644 ${srcdir}/${_bzrmod}/session/unity-2d.desktop ${pkgdir}/usr/share/xsessions/unity-2d.desktop
}
 
