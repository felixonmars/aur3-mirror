# Maintainer: Steven Vanden Branden<stevenvandenbrandenstift at gmail dot com>

pkgname=('gnome-dvb-daemon-git')
_source_pkgname=gnome-dvb-daemon
pkgver=1300.840fbd4
pkgrel=1
pkgdesc="gnome digital video broadcasting recording daemon"
arch=('i686' 'x86_64')
license=('GPL')
url="https://wiki.gnome.org/projects/dvbdaemon"
depends=('libgee' 'gst-rtsp-server-git' 'gst-plugins-bad-git' 'hicolor-icon-theme' 'sqlite' 'python')
makedepends=( 'pkg-config' 'gnome-common-git' 'vala-git')
options=(!libtool)
source=('.AURINFO' 'git://github.com/gnome/gnome-dvb-daemon')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd gnome-dvb-daemon
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "${srcdir}/gnome-dvb-daemon"
  git describe --tag | sed 's/-.*//g' > .tarball-version
}

build() {
  cd "${srcdir}/gnome-dvb-daemon"
 ./autogen.sh --prefix=/usr --exec_prefix=/usr
  make
}

package() {
  cd "${srcdir}/gnome-dvb-daemon"

  make DESTDIR="${pkgdir}/" install
  gtk-update-icon-cache
}
