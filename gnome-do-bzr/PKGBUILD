# Maintainer: Josh Silard <jsilard (at) gmail (dot) com>
# Contributor: Alessio Biancalana <dottorblaster@archlinux.us>
# Contributor: Alessio Sergi <asergi {at} archlinux.us>

pkgname=gnome-do-bzr
_realname=gnome-do
pkgver=1379
pkgrel=1
pkgdesc="A launcher application for GNOME"
arch=('i686' 'x86_64')
url="https://launchpad.net/do"
license=('GPL3')
depends=('desktop-file-utils' 'gio-sharp' 'gnome-desktop-sharp' 'gnome-keyring-sharp' \
         'gnome-sharp' 'gtk2' 'mono-addins' 'hicolor-icon-theme' 'ndesk-dbus-glib' \
         'notify-sharp-svn' 'xdg-utils')
makedepends=('bzr' 'intltool' 'ca-certificates')
provides=(${_realname})
conflicts=(${_realname})
options=('!libtool')
install=$pkgname.install

_bzrtrunk="lp:do"
_bzrmod=${_realname}

build() {
  export MONO_SHARED_DIR=${srcdir}/.wabi
  mkdir -p ${MONO_SHARED_DIR}

  cd ${srcdir}

  msg "Connecting to the server...."

    if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi

  msg "Starting make..."

  rm -rf ${_bzrmod}-build
  cp -r ${_bzrmod} ${_bzrmod}-build
  cd ${_bzrmod}-build

  ./autogen.sh && ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd ${srcdir}/${_bzrmod}-build

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema $pkgdir/usr/share/gconf/schemas/$_realname.schemas \
                      $pkgdir/etc/gconf/schemas/*.schemas
  rm -f $pkgdir/etc/gconf/schemas/*.schemas

  rm -rf $pkgdir/usr/lib/gnome-do/*.mdb
}
