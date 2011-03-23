# Maintainer: Jan Ahrens <jan dot ahrens at googlemail dot com>
pkgname=groovyserv
pkgver=0.6
pkgrel=1
pkgdesc="GroovyServ makes Groovy's startup time much faster, by pre-invoking Groovy as a server."
arch=(i686 x86_64)
url="http://kobo.github.com/groovyserv/index.html"
license=('apache-ant')
depends=('groovy')
makedepends=('maven')
source=(https://github.com/downloads/kobo/groovyserv/$pkgname-$pkgver-src.zip)
md5sums=('3ac9775fdad7244321b69f7c7d5cbff7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mvn clean verify
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -a target/${pkgname}-${pkgver}.dir/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}/

  # hopefully we don't need cmd.exe, so remove the .bat-file
  rm ${pkgdir}/opt/groovyserv/bin/groovyserver.bat
}

# vim:set ts=2 sw=2 et:
