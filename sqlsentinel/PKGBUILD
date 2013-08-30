# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Amedeo Arch <ingamedeo[at]gmail[dot]com>

pkgname=sqlsentinel
pkgver=0.3
_pkgver=0.3
pkgrel=2
pkgdesc="A tool for SQL injection security testing"
arch=('any')
url='http://sourceforge.net/projects/sqlsentinel/'
license=('LGPL2.1')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/${pkgname}/SQLSentinel_v_${_pkgver}.zip"
        'sqlsentinel.sh')
md5sums=('9a47c1c57b79a5e561896f8cca972d61'
         'dc0b10c4e266f61bb9af86999c600405')

package() {
  cd "${srcdir}"

  JAVA_DIR="${pkgdir}/usr/share/java/${pkgname}"

  install -d "${JAVA_DIR}"
  install -m755 ${pkgname}.jar "${JAVA_DIR}"

  install -d "${JAVA_DIR}"/lib
  install -m755 lib/*.jar "${JAVA_DIR}"/lib

  install -Dm755 sqlsentinel.sh "${pkgdir}"/usr/bin/sqlsentinel
}
