# Francisco Dominguez Lerma francisco.dominguez.lerma@gmail.com
pkgname="snakecode"
pkgver="0.1"
pkgrel="1"
pkgdesc="Sencillo motor de cifrado en python"
arch=(any)
url="http://hispagnu.no-ip.org/scripts/snakecode.tar"
license=('gpl3')
groups=('system')
depends=('python2')
makedepends=()
source=('http://hispagnu.no-ip.org/scripts/snakecode.tar')
md5sums=('f1a218b97dfe213aa7909e689bb516ed')

package() {
mkdir -p $pkgdir/usr/lib/python2.7
install $srcdir/snakecode/snakecode.py $pkgdir/usr/lib/python2.7
}

