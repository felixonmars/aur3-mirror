# Contributor: Megamixan <Megamixman@gmail.com>
pkgname=gestikk-bzr
pkgver=81
pkgrel=1
pkgdesc="A Gesture input system for Gnome"
url="http://gestikk.reichbier.de/"
license="GPL"
arch=('i686' 'x86_64')
depends=('python' 'python-virtkey' 'xdotool' 'gnome-python-desktop' 'pyparsing' 'pygtk' 'kiwi')
makedepends=('bzr')
conflicts=('')
provides=('')
source=()
md5sums=()

_bzrmod="main"
_bzrtrunk="http://bazaar.launchpad.net/~gestikk/gestikk/main"

build() {
  if [[ -d $startdir/src/$_bzrmod ]] ; then
    cd $startdir/src/$_bzrmod
    bzr update || return 1
    msg "Files are up to date."
  else
    cd $startdir/src/
    bzr branch $_bzrtrunk || return 1
    cd $_bzrmod
  fi
  msg "Bazaar checkout done."
  msg "Building..."
  python fill_constants.py
  rm -f fill_constants.py generate_pot.sh
  rm -f gestikk.pot paint_gesture.py del_files.py
  rm -f make_release.sh
  rm -f *.pyc
  mkdir -p ../../pkg/usr/share/gestikk
  cp -R * ../../pkg/usr/share/gestikk
}
