# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Contributor: Denis Zawada <deno@rootnode.net>

_upname=rygel
_upver=4.2.1
pkgname=rygel-git
pkgver=20091022
pkgrel=1
pkgdesc="Rygel is an implementation of the UPnP MediaServer V 2.0 \
         specification that is specifically designed for GNOME (Mobile). It is \
         based on GUPnP and is written (mostly) in Vala language."
arch=('i686' 'x86_64')
url="http://live.gnome.org/Rygel"
license=('GPL')
groups=()
depends=('gupnp>=0.13' 'gupnp-av>=0.5' 'gstreamer0.10' 'libgee>=0.3.0' 'gconf>=2.16' 'dbus-glib' 'libsoup' 'sqlite3')
makedepends=('gtk-doc' 'pkgconfig' 'gupnp-vala>=0.6' 'vala>=0.7.8')
optdepends=('Tracker Search Daemon'
            'GNOME DVB Daemon')
provides=("rygel=${_upver}")
conflicts=('rygel')
replaces=('gupnp-media-server')
backup=()
options=('!libtool')
install=""
source=()
noextract=()
md5sums=()

_gitroot=git://git.gnome.org/${_upname}
_gitname=maser

build() {
  cd "${srcdir}"
  if [ -d "${_upname}" ] ; then
    cd "${_upname}" && git pull --rebase || return 1
  else
    git clone --depth 1 "${_gitroot}" || return 1
    cd "${_upname}"
  fi
  sh autogen.sh || return 1
  ./configure --enable-vala \
              --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --enable-gst-launch --enable-test-plugin
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
