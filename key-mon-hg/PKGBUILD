# Maintainer: Andre Wayand <aur-key-mon-git@awayand.sleepmail.com>
pkgname=key-mon-hg
pkgver=306
pkgrel=2
pkgdesc=""
arch=('any')
url="http://code.google.com/p/key-mon/"
license=('apache-ant')
depends=('pygtk' 'dbus-glib' 'dbus-python')
conflicts=('key-mon')
makedepends=('mercurial' 'python2-distribute' 'python-xlib')
backup=()
install=${pkgname}.install

_hgroot='https://code.google.com/p'
_hgrepo='key-mon'

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"

}

package() {
  cd "$srcdir/$_hgrepo-build"
  python2 setup.py install --root=${pkgdir}
  install -m 755 ${srcdir}/key-mon/icons/key-mon.desktop -D ${pkgdir}/usr/share/applications/key-mon.desktop
  install -m 755 ${srcdir}/key-mon/icons/key-mon.xpm -D ${pkgdir}/usr/share/pixmaps/key-mon.xpm
}
