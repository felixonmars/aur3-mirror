# Maintainer: Chen Tong <blovemaple2010@gmail.com>

pkgname=java-jline2
pkgver=2.11
pkgrel=1
pkgdesc='A Java library for handling console input, an evolution of JLine 1.x.'
arch=('i686' 'x86_64')
url='https://github.com/jline/jline2'
license=('BSD')
makedepends=('maven')
depends=('java-runtime-headless')
source=("https://github.com/jline/jline2/archive/jline-${pkgver}.tar.gz")

md5sums=("57bcd79aad977b4137c7acba20870caf")

build() {
  cd jline2-jline-${pkgver}
  
  mvn install
}

package() {
  cd jline2-jline-${pkgver}/target
  targetdir="/usr/share/java/jline2"

  install -D -m644 \
    jline-${pkgver}.jar $pkgdir${targetdir}/jline-${pkgver}.jar
  ln -s jline-${pkgver}.jar $pkgdir${targetdir}/jline2.jar 

  install -D -m644 \
    jline-${pkgver}-sources.jar $pkgdir${targetdir}/jline-${pkgver}-sources.jar
  ln -s jline-${pkgver}-sources.jar $pkgdir${targetdir}/jline2-sources.jar 
}

