# Contributor: Marty (neodivx@neodivx.be); tony (chatalorss@free.fr)
pkgname=neodivxlazarus
pkgver=1.2.0.978
pkgrel=1
pkgdesc="To encode easily under Linux :-)"
arch=('i686' 'x86_64')
depends=('lsdvd' 'libdvdcss' 'mplayer' 'lirc' 'xvidcore' 'lame')
license=('custom')
url="http://www.neodivx.be/neodivx/index.html"
install=('neodivxlazarus.install')
source=("http://chatalorss.free.fr/neodivx/${pkgname}.tar.gz") 
md5sums=('4731258eb7c9ecdab9a3b3f48bda4589')

build() {
  cd $startdir/src/
  cp -r usr $startdir/pkg
  cp -r etc $startdir/pkg
}
