# Maintainer: Andrew Chen <llkiwi2006@gmail.com>

pkgname=tomcat8-src
pkgver=8.0.18
pkgrel=1
pkgdesc='Tomcat 8 sources'
arch=('any')
url='http://tomcat.apache.org/'
license=('APACHE')
makedepends=('zip')
source=(http://archive.apache.org/dist/tomcat/tomcat-8/v${pkgver}/src/apache-tomcat-${pkgver}-src.tar.gz)

md5sums=('a57119b64a853c796de6b319effae632')

package() {
  cd "${srcdir}/apache-tomcat-${pkgver}-src"
  
  cd java
  zip -r ../src.zip *
  cd ..

  install -Dm644 src.zip "${pkgdir}"/usr/share/${pkgname%%-*}/src.zip
}
