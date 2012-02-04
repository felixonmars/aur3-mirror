# $Id: PKGBUILD 128602 2011-06-24 13:59:34Z ibiru $
# Maintainer: Gary van der Merwe <garyvdm@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=python-dbus-bzr
pkgver=660
pkgrel=2
pkgdesc="Python 3 bindings for DBUS (port by Barry Warsaw)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://www.freedesktop.org/wiki/Software/DBusBindings"
depends=('dbus-core' 'python')
makedepends=('bzr' 'pkg-config' 'docutils' 'dbus-glib')
optdepends=('dbus-glib: glib mainloop support')
provides=('python-dbus')
options=('!libtool')

_bzrtrunk=http://bazaar.launchpad.net/~garyvdm/python-dbus/py3k-works/
_bzrmod=python-dbus


build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"


  ./autogen.sh --prefix=/usr --docdir=/usr/share/doc/python-dbus
  make
}

package() {
  cd "$srcdir/$_bzrmod-build"
  make DESTDIR="$pkgdir/" install
  rm "$pkgdir/usr/lib/pkgconfig/" -r
  rm "$pkgdir/usr/include/" -r
}

