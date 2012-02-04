# Contributor: Tilman Blumenbach <tilman (at) ax86 (dot) net>
# Maintainer: moostik <mooostik_at_gmail.com>

pkgname='geonext'
pkgver=1.74
pkgrel=1
pkgdesc='Dynamic mathematics software, tool for creating geometric constructions.'
arch=('any')
url='http://geonext.uni-bayreuth.de'
license=('GPL')
depends=('java-runtime')
source=("http://geonext.uni-bayreuth.de/data/download/${pkgver}/${pkgname}.${pkgver}.zip"
	"${pkgname}.sh")
md5sums=('a99b36f34978ed4e550ff31ed6315a3a'
         '3a01e29a3ce47212c3c3d7d1c82f61cb')

package()
{
  cd "${srcdir}/${pkgname}_install"
  install -d -m755 "${pkgdir}/usr/share/java/${pkgname}"
  install -D -m644 *.jar "${pkgdir}/usr/share/java/${pkgname}"

  # Copy the startup script
  install -d -m755 "$pkgdir/usr/bin"
  install -D -m755 "${srcdir}/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
