# Maintainer: Snorri Agnarsson (snorri at hi dot is)
# Contributor: Tritlo <icetritlo at gmail dot com>

pkgname=morpho
pkgver=1.0
pkgrel=1
epoch=1
pkgdesc="The Morpho Programming Language"
arch=('any')
url="http://morpho.cs.hi.is"
license=('Apache')
depends=('jre7-openjdk')

source=(http://morpho.cs.hi.is/morpho/dist/morpho.jar)
md5sums=('950ffe77fc884daca16a3349493f8e52')

build(){
  JAR=/usr/share/morpho/morpho.jar
  echo -e \#\!/bin/bash\\nexec java -jar $JAR \$\@ > morpho

}

package() {
  cd "$srcdir"
  install -D -m644 "${srcdir}/morpho.jar" "${pkgdir}/usr/share/morpho/morpho.jar"
  install -D -m755 "${srcdir}/morpho" "${pkgdir}/usr/bin/morpho" 
  rm morpho
}

