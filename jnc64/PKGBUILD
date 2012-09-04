# Contributor: yannsen <ynnsen@gmail.com>
pkgname=jnc64
pkgver=0.16
pkgrel=2
pkgdesc="A wrapper for the Juniper network connect client (ncsvc) - x86_64 Version"
arch=('x86_64')
url="http://www.rz.uni-karlsruhe.de/~iwr91/juniper/"
license=('GPL')
depends=('openssl' 'perl' 'net-tools' 'lib32-glibc' 'lib32-zlib')
provides=('jnc')
makedepends=()
optdepends=('java: for Network Connect Java GUI, with x86_64 the Network Connect Java GUI will not work')
source=(http://www.rz.uni-karlsruhe.de/~iwr91/juniper/jnc)
md5sums=('a2b38bfc94093efe08952fd7050d8c78')

package() {
  install -d $pkgdir/usr/bin/
  install -m755 jnc $pkgdir/usr/bin/
}

