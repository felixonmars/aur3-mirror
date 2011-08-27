# Contributor: Rafael G. Martins <rafael@rafaelmartins.com>
pkgname=gustop
pkgver=0.6.0
pkgrel=1
pkgdesc="An client-server version of a classic game"
arch=('i686' 'x86_64')
url="http://www.gustop.com.br/"
license=('unknown')
depends=('jre')
source=(http://www.gustop.com.br/${pkgver}/${pkgname}.jar \
        ${pkgname}.desktop \
        ${pkgname})
md5sums=('ecb659b6d8fc8e363b20939b978e53f0'
         '03c3eda1b5495def160b06aa28b4858b'
         '7521c63c2bddee994acf26200e196918')
noextract=(${pkgname}.jar)

build(){
  mkdir -p "${pkgdir}/usr/share/${pkgname}" \
           "${pkgdir}/usr/share/applications" \
           "${pkgdir}/usr/bin"
  install -D -m644 ${pkgname}.jar ${pkgdir}/usr/share/${pkgname}/
  install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/
}

