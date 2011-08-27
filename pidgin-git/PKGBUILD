# Contributor: Emanuele Rossi <newdna1510@yahoo.it>
# Contributor: Alessio 'alexwizard' Sergi <sergi.alessio {at} gmail.com>

pkgname=pidgin-git
_realname=pidgin
pkgver=20090912
pkgrel=1
pkgdesc="Pidgin Development GIT Version"
arch=('i686' 'x86_64')
url="http://gitorious.org/pidgin-clone"
license=('GPL')
depends=('avahi' 'dbus-glib' 'farsight2' 'nss' 'startup-notification')
makedepends=('git' 'intltool')
optdepends=('tk: Tcl/Tk scripting support'
            'ca-certificates: SSL CA certificates')
provides=(${_realname})
conflicts=(${_realname})
replaces=('gaim')
options=('!libtool')
install=${pkgname}.install
source=()
md5sums=()

_gitroot=git://gitorious.org/pidgin-clone/mainline.git
_gitname=pidgin-git

build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d ${_gitname}-build ] && rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build
  cd ${_gitname}-build

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --disable-schemas-install \
    --disable-meanwhile --disable-nm --disable-perl --disable-gnutls \
    --disable-doxygen --disable-gtkspell --disable-gestures \
    --disable-consoleui --disable-tk --disable-tcl \
    --disable-screensaver --with-system-ssl-certs=/etc/ssl/certs || return 1

  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove GConf schema file
  rm -rf "$pkgdir/etc" || return 1

#  rm -rf ${srcdir}/${_gitname}-build
}

# vim:set ts=2 sw=2 et:
