# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: Hugo Doria <hugodoria@gmail.com>

pkgname=listen-bzr
_bzrname=listen
pkgver=1307
pkgrel=4
pkgdesc="Music player and management for GNOME (development version)"
arch=('i686' 'x86_64')
url="https://launchpad.net/listen"
license=('GPL2')
depends=('python2-egg' 'python2-libgnome' 'mutagen' 'desktop-file-utils'
         'gnome-icon-theme' 'gstreamer0.10-python' 'notification-daemon' 'pyxdg'
         'pywebkitgtk' 'python2-pyinotify' 'gstreamer0.10-good-plugins' 'dbus-python')
makedepends=('bzr' 'intltool' 'docbook2x' 'docbook-xml')
optdepends=('python-musicbrainz2: musicbrainz & cd support'
            'libgpod: iPod support'
            'python-daap: DAAP support'
            'tunepimp: tagging support')
provides=('listen=0.6.5.99')
conflicts=('listen')
install=listen.install
source=("$_bzrname::bzr+http://bazaar.launchpad.net/~listen-devel/$_bzrname/devel/")
sha256sums=('SKIP')

pkgver() {
  cd $_bzrname
  bzr revno
}

build() {
  cd "${srcdir}/$_bzrname"

  chmod +x mmkeys/setup.py

  # Fix command name
  sed -i 's/docbook2x-man/docbook2man/' Makefile

  # Point Python scripts to the python2 binary
  sed -i -e 's/python -/python2 -/' \
         -e 's/PYTHON  = python$/\02/' \
    Makefile
  sed -i 's/env python$/env python2/' mmkeys/setup.py
  sed -i 's|/usr/bin/python|/usr/bin/python2|' src/listen

  make CHECK_DEPENDS=0 PREFIX=/usr
}

package() {
  cd "${srcdir}/$_bzrname"

  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
