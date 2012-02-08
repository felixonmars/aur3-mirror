# Maintainer:
# Contributor: Brett L Kleinschmidt <blk at blk dot me>

_basename=pragha
pkgname=${_basename}-gst
pkgver=1.0
pkgrel=3
pkgdesc="A lightweight GTK+ music manager using gstreamer"
arch=('i686' 'x86_64')
url="http://pragha.wikispaces.com/"
license=('GPL')
depends=('gstreamer0.10-base' 'gtk2' 'libcdio' 'libnotify' 'sqlite3' 'desktop-file-utils' 'taglib' 'dbus-glib' 'hicolor-icon-theme')
optdepends=('exo: better session management'
            'liblastfm_c-git: last.fm scrobbling'
            'keybinder: global keyboard shortcuts'
            'glyr-git: search lyrics, artists info, and album art')
makedepends=('autoconf' 'xfce4-dev-tools')
provides=('pragha' 'pragha-svn')
source=(http://dissonance.googlecode.com/files/${_basename}-${pkgver}.tar.bz2)
md5sums=('f0f8bf7353e429a70dbbbcb99f925ae1')

build() {
  cd ${srcdir}/${_basename}-${pkgver}
  ./configure --prefix=/usr
  make ${MAKEFLAGS} || return 1
}

package() {
  cd ${srcdir}/${_basename}-${pkgver}
  make ${MAKEFLAGS} DESTDIR=${pkgdir} install
  
  install -m 644 data/pragha.desktop ${pkgdir}/usr/share/applications
  install -d ${pkgdir}/usr/share/pixmaps
  install -m 644 data/pragha.png ${pkgdir}/usr/share/pixmaps/
  install -m 644 data/pragha.1 ${pkgdir}/usr/share/man/man1/
}

# vim:set ts=2 sw=2 et:
