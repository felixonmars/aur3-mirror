# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: hm_b < holger at music-nerds dot net>
pkgname=libprolooks  
pkgver=1.0.0
pkgrel=1
pkgdesc="a custom widget library for Gtk+ designed for audio applications"
url="http://www.hansfbaier.de/wordpress/libprolooks/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'vala==0.6.1-1')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(https://launchpad.net/~hansfbaier/+archive/ppa/+files/${pkgname}1_$pkgver~ppa2~jaunty.tar.gz)
md5sums=('4a88d5bc5bc1fa23ba2eeddfa799b68e')
build() {
  cd $startdir/src/$pkgname
  ./waf configure --prefix=/usr
  ./waf build || return 1
  ./waf install --destdir=$startdir/pkg
}