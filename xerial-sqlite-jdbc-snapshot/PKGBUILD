# Maintainer: Ivan Abdulin <elbahek@gmail.com>

pkgname=xerial-sqlite-jdbc-snapshot
pkgver=3.7.15
_fullname=sqlite-jdbc-${pkgver}-SNAPSHOT
pkgrel=1
pkgdesc="Xerial implementation of SqliteJDBC"
arch=('i686' 'x86_64')
url="https://bitbucket.org/xerial/sqlite-jdbc"
license=('Apache')
depends=('java-runtime')
source=(https://bitbucket.org/xerial/sqlite-jdbc/downloads/${_fullname}.jar)

package() {
  install -D -m644 \
    $srcdir/${_fullname}.jar \
    $pkgdir/usr/share/java/${pkgname}/${_fullname}.jar
  ln -s ${_fullname}.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
}
md5sums=('67f46a13b007d8d664b2e17224dadaea')
