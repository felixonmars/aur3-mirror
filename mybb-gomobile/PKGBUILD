# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=mybb-gomobile
_pkgname=MyBB-GoMobile
pkgver=1.1.ebc6ee81
pkgrel=1
pkgdesc="A free mobile solution for the MyBB forum system"
install=mybb-gomobile.install
arch=('any')
url=('https://github.com/jasonliehr/MyBB-GoMobile')
license=('GPL')
depends=('mybb')
source=("${pkgname}::git+https://github.com/jasonliehr/${_pkgname}.git#commit=ebc6ee81109abac92f395669450c1bd8ecf5149f")
md5sums=('SKIP')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/mybb/
  
  cp -ra ${srcdir}/${pkgname}/Upload/{images,inc} ${pkgdir}/usr/share/webapps/mybb/
}
