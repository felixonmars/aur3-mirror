# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=libdesktop-agnostic-bzr
_pkgname=libdesktop-agnostic
pkgver=405
pkgrel=2
pkgdesc="A desktop-agnostic library for GLib-based projects"
arch=('i686' 'x86_64')
url="https://launchpad.net/libdesktop-agnostic"
license=('GPL2' 'LGPL2.1')
depends=('pygtk' 'python2-gobject2')
makedepends=('bzr' 'gconf' 'gobject-introspection' 'intltool' 'vala')
optdepends=('gconf: gconf configuration backend')
provides=($_pkgname)
conflicts=($_pkgname)
backup=(etc/xdg/$_pkgname/desktop-agnostic.ini)
options=('!libtool')
source=('gir.patch')
md5sums=('346e06ae914ec0c12e5f1fa1c4796575')
#md5sums=('69bf989b9204fe886c958b279822696c')

_bzrtrunk="https://code.launchpad.net/~lda-team/libdesktop-agnostic/trunk"
_bzrmod="$_pkgname"

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

  # fix to turn on introspection
  patch -Np1 -i "$srcdir"/gir.patch

  # python2 fix
  sed -i '1s|^#!.*python$|&2|' waf

  export PYTHON="/usr/bin/python2"
  export VALAC="/opt/vala-0.12/bin/valac"

  ./waf configure --prefix=/usr --sysconfdir=/etc \
                  --config-backends=gconf,keyfile \
                  --vfs-backends=gio \
                  --desktop-entry-backends=gio,glib
  ./waf
}

package() {
  cd "$srcdir/$_bzrmod-build"

  ./waf install --destdir="$pkgdir/" --sysconfdir="$pkgdir"/etc
}

# vim:set ts=2 sw=2 et:
