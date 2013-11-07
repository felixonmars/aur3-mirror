# Maintainer: Simone Sclavi 'Ito'  <darkhado@gmail.com>
pkgname=keepass-it
pkgver=2.24
pkgrel=1
pkgdesc="Italian locale for keepass"
license=('GPL')
depends=('keepass>=2.24')
url="http://keepass.info/translations.html"
source=(http://downloads.sourceforge.net/keepass/KeePass-${pkgver}-Italian.zip)
md5sums=('43b816c48c472b1ed33f8ef094d1f530')
install=keepass-it.install
arch=('any')
package(){
    install -D -m644 Italian.lngx $pkgdir/usr/share/keepass/Italian.lngx
}
