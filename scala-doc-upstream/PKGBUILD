# Maintainer: Sergiusz Urbaniak <sergiusz.urbaniak@gmail.com>

pkgname=scala-doc-upstream
pkgver=2.10.3
pkgrel=1
pkgdesc="API documentation for the Scala language"
arch=('any')
url="http://www.scala-lang.org"
license=('custom')
depends=('bash')
source=("http://www.scala-lang.org/files/archive/scala-docs-${pkgver}.txz")
md5sums=('869af24fe0f5df49ff90982635d9aa23')
conflicts=('scala-doc')
provides=("scala-upstream-doc=${pkgver}")
replaces=('scala-doc')

package() {
  cd ${srcdir}/scala-docs-${pkgver}

  install -d ${pkgdir}/usr/share/doc/scala-doc
  install -d ${pkgdir}/usr/share/scala/doc/scala-devel-docs

  cp -r * ${pkgdir}/usr/share/doc/scala-doc
  ln -s ../../../doc/scala-doc ${pkgdir}/usr/share/scala/doc/scala-devel-docs/api
}
