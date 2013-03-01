# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Fernando Henrique <arch at liquuid dot net> 

pkgname=makagiga
pkgver=4.6
pkgrel=1
pkgdesc="A free, easy-to-use, cross-platform application for doing a variety of tasks, such as text editing, todo listing, RSS reading, and simple image viewing."
url="http://makagiga.sourceforge.net"
depends=( 'java-runtime=7' )
license=('APACHE')
arch=('any')
source=(http://ufpr.dl.sourceforge.net/sourceforge/makagiga/$pkgname-$pkgver.zip)
md5sums=('10ffb6788640f9bbe07c5ff1bb0fc0c1')

build() {
  cd $srcdir/$pkgname-$pkgver 
  ./install.sh $pkgdir/usr
  rm $pkgdir/usr/share/makagiga/uninstall.sh
  sed -i "s#$pkgdir##" $pkgdir/usr/{bin/makagiga,share/applications/makagiga.desktop}
}

