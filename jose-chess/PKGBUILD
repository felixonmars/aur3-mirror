# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=jose-chess  
pkgver=1.44
pkgrel=2
pkgdesc="Graphical chess tool and game"
url="http://jose-chess.sourceforge.net/"
arch=('i686')
license=('GPL')
install=jose.install
depends=('gcc-libs' 'jre' 'libgl' 'libstdc++5')
optdepends=('mysql: for having a mysql chess db')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/jose-144-linux.zip)
md5sums=('c36ec11a2703a2fdc92106b33ac737e5')
noextract=('jose-144-linux.zip')
build() {
 install -d $pkgdir/usr/share/ || return 1
 cd $pkgdir/usr/share
 bsdtar -xvf $srcdir/jose-144-linux.zip || return 1
 find  $pkgdir/usr/share/jose -type f -exec chmod 664 {} \; || return 1
 chmod 755 $pkgdir/usr/share/jose/jose.sh || return 1
 find  $pkgdir/usr/share/jose -type d -exec chmod 775 {} \; || return 1
}