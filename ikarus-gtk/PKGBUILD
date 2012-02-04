# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Geoffrey Teale <tealeg@member.fsf.org>
pkgname=ikarus-gtk
pkgver=bzr
pkgrel=1 
pkgdesc="A library to allow ikarus programs to use Gtk+ 2.x via gtkserver"
url="https://code.launchpad.net/~derick-eddington/ikarus-libraries/gtk"
arch=('i686')
license=('GPL')
depends=('ikarus>=0.0.3-6' 'gtk-server')
makedepends=('ikarus')
conflicts=()
replaces=()
backup=()
install=ikarus-gtk.install
source=()
md5sums=()
build() {
  echo -n "Pulling source from launchpad ..."
  bzr checkout --lightweight http://bazaar.launchpad.net/~derick-eddington/ikarus-libraries/gtk
  find ./ -name ".bzr" -exec rm -rf {} \; &> /dev/null
  mkdir -p $startdir/pkg/usr/lib/ikarus/
  cp -r gtk  $startdir/pkg/usr/lib/ikarus/
}