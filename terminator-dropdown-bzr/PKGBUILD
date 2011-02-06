# Maintainer: Peter B. Jørgensen <peterbjorgensen@gmail.com>
# PKGBUILD is heavily based on terminator-bzr by:
# Orig Maintainer:  TDY <tdy@gmx.com>
# Contributor: zhuqin <zhuqin83@gmail.com>

pkgname=terminator-dropdown-bzr
pkgver=1024
pkgrel=1
pkgdesc="A tool for arranging multiple terminals in a single window - dropdown bzr branch"
arch=('i686' 'x86_64')
url="http://www.tenshu.net/terminator/"
license=('GPL')
depends=('hicolor-icon-theme' 'pygtk' 'vte' 'xdg-utils')
makedepends=('bzr' 'desktop-file-utils' 'gettext' 'intltool')
optdepends=('gnome-python: gnome-terminal profile support')
provides=('terminator=0.13')
conflicts=('terminator')
install=terminator.install

#_bzrtrunk=http://bazaar.launchpad.net/~gnome-terminator/terminator/trunk
_bzrtrunk=https://code.launchpad.net/~peterbjorgensen/terminator/dropdown
_bzrmod=terminator

build() {
  cd "$srcdir"

  msg "Connecting to $_bzrtrunk..."
  if [[ -d $_bzrmod ]]; then
    bzr up $_bzrtrunk
    msg2 "Local files updated"
  else
    bzr co $_bzrtrunk $_bzrmod -r $pkgver
    msg2 "BZR checkout done"
  fi

  rm -rf $_bzrmod-build
  cp -r $_bzrmod $_bzrmod-build
  cd $_bzrmod-build

  msg "Starting make..."
  python setup.py build || return 1
}

package() {
  cd "$srcdir/$_bzrmod-build"
  python setup.py install --prefix=/usr --root="$pkgdir"
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}
