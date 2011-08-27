# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: hm_b <holger at music-nerds.net>
pkgname=jackpanel  
pkgver=0.1.0
pkgrel=1
pkgdesc="A graphical control application for the JACK audio server for GNOME"
url="http://www.hans-baier.de/wordpress/jackpanel"
arch=('i686')
license=('GPL')
depends=('jack-audio-connection-kit>=0.116.2' 'libprolooks' 'gnome-panel' 'vala==0.6.1-1')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(https://launchpad.net/~hansfbaier/+archive/ppa/+files/${pkgname}_$pkgver~ppa3~jaunty.tar.gz)
md5sums=('fd76363fe4912e896e48c44caf25b7ba')
build() {
  cd $startdir/src/$pkgname
  ./waf configure --prefix=/usr
  ./waf build || return 1
  ./waf install --destdir=$startdir/pkg
}
