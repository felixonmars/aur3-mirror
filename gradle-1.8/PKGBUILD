# Maintainer: Emanuel Couto <emanuel dot amaral dot couto at gmail dot com>
# Contributor: Chris Molozian (novabyte) <chris dot molozian at gmail dot com>
pkgname='gradle-1.8'
pkgver='1.8'
pkgrel=2
pkgdesc='A powerful build system for the JVM'
arch=('any')
url='http://www.gradle.org/'
license=('APACHE')
depends=('java-environment' 'bash')
source=('https://services.gradle.org/distributions/gradle-1.8-bin.zip')
md5sums=('4cb542e09fb659df3a731a4bf92f4dce')

package() {
  cd "${srcdir}/${pkgname}"

  # create the necessary directory structure
  install -d "${pkgdir}/usr/share/java/${pkgname}/bin"
  install -d "${pkgdir}/usr/share/java/${pkgname}/lib/plugins"
  install -d "${pkgdir}/usr/share/java/${pkgname}/init.d"
  install -d "${pkgdir}/usr/bin"

  # copy across jar files
  install -Dm644 lib/*.jar "${pkgdir}/usr/share/java/${pkgname}/lib"
  install -Dm644 lib/plugins/*.jar "${pkgdir}/usr/share/java/${pkgname}/lib/plugins"

  # copy across supporting text documentation and scripts
  install -m644 NOTICE "${pkgdir}/usr/share/java/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/java/${pkgname}"
  install -m644 *.txt "${pkgdir}/usr/share/java/${pkgname}"
  install -m644 *.html "${pkgdir}/usr/share/java/${pkgname}"
  install -m755 bin/gradle "${pkgdir}/usr/share/java/${pkgname}/bin"
  install -m644 init.d/*.* "${pkgdir}/usr/share/java/${pkgname}/init.d"

  # link gradle script to /usr/bin
  ln -s /usr/share/java/${pkgname}/bin/gradle ${pkgdir}/usr/bin/gradle-1.8
}
