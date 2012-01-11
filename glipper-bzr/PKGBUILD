# Maintainer: crazyelf5

pkgname=glipper-bzr
pkgver=116
pkgrel=1
pkgdesc="Clipboard manager for GNOME"
arch=('i686' 'x86_64')
url="https://launchpad.net/glipper"
license=('GPL2')
depends=('python2' 'python2-gconf' 'python2-gobject2' 'pygtk' 'python-keybinder' 'pyxdg' 'gconf' 'gtk-update-icon-cache' 'hicolor-icon-theme' 'gettext')
makedepends=('bzr')
install=$pkgname.install

_bzrtrunk=lp:glipper
_bzrmod=glipper

build() {
  msg "Connecting to Bazaar server...."

  if [ -d $_bzrmod ]; then
    cd $_bzrmod && bzr pull $_bzrtrunk -r $pkgver
    msg "The local files are updated."
    cd "$srcdir"
  else
    bzr branch $_bzrtrunk $_bzrmod -r $pkgver
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d $_bzrmod-build ] && rm -rf $_bzrmod-build
  cp -r $_bzrmod $_bzrmod-build
  cd $_bzrmod-build
  python2 ./setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
