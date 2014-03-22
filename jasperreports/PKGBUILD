# Maintainer: Pavol Kapusta <pavol.kapusta@gmail.com>
pkgname=jasperreports
pkgver=5.5.1
pkgrel=1
pkgdesc='Open source reporting engine entirely written in Java'
arch=('any')
url='http://community.jaspersoft.com/project/jasperreports-library'
license=('LGPL')
depends=('java-environment')
# optdepends=('')
source=(http://sourceforge.net/projects/jasperreports/files/jasperreports/JasperReports%20${pkgver}/jasperreports-${pkgver}-project.tar.gz)
md5sums=('13bc23b5c03a51202217eb1805200681')
package() {
cd "${srcdir}/${pkgname}-${pkgver}"
install -dm755 "${pkgdir}"/usr/share/java/${pkgname}/{dist,lib}
install -m644 dist/*.jar "${pkgdir}"/usr/share/java/${pkgname}/dist
install -m644 lib/*.jar "${pkgdir}"/usr/share/java/${pkgname}/lib
install -Dm644 "${srcdir}"/$pkgname-$pkgver/license.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}