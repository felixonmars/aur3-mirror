# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Ben Mazer <blm@groknil.org>
# Contributor: Alexandre Rosenfeld <airmind@gmail.com>

pkgname=muine-git
pkgver=20090505
pkgrel=1
pkgdesc="A music player written in C#"
arch=(i686 x86_64)
license=('GPL')
url="http://www.muine-player.org/"
depends=('gnome-sharp>=2.24.0' 'gstreamer0.10-good-plugins' 'gstreamer0.10-base-plugins' 'desktop-file-utils' 'libgnomeui>=2.24.0' 'libid3tag' 'faad2>=2.7' 'ndesk-dbus-glib')
makedepends=('intltool' 'pkgconfig' 'gnome-icon-theme' 'git')
optdepends=('gstreamer0.10-ugly-plugins: Extra media codecs'
            'gstreamer0.10-bad-plugins: Extra media codecs'
	    'gstreamer0.10-ffmpeg: Extra media codecs')
options=('!libtool' '!emptydirs' '!makeflags')
install=muine.install
#source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.8/${pkgname}-${pkgver}.tar.bz2)
#md5sums=('28e561388de1deebc6336f936bc74a73')

_gitroot="git://git.gnome.org/muine"
_gitname="muine"


build() {

  msg "Connecting to git.gnome.org GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."


  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build
 
  #cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --enable-gstreamer || return 1
  make || return 1
  make DESTDIR="${pkgdir}" GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install || return 1

  install -m755 plugins/TrayIcon.{dll,xml} "${pkgdir}/usr/lib/muine/plugins/" || return 1
  install -m644 plugins/muine-tray-*.png "${pkgdir}/usr/lib/muine/plugins/" || return 1

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
