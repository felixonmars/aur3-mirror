#Maintainer: Nathan Owe <ndowens.aur at gmail dot com> 
pkgname=dbjmin
pkgver=0.5rc3
pkgrel=1
pkgdesc="Graphical Client for databases"
arch=('any')
url="http://dcon.com.br/dbjmin/"
license=('GPL2')
depends=('java-runtime')
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.zip" "${pkgname}.sh")
md5sums=('786e10014c489dfe71921ce820a2a31e'
         '3b43841019b0b5ba9188e3067e32216b')

build() {
  /bin/true
}

package() {
  cd "${srcdir}"

  install -d ${pkgdir}/{usr/bin,opt/${pkgname}/icons}

  install -D ${pkgname}-${pkgver}.jar dbjmin.png LICENSE \
    README preServers.xml VERSION ${pkgdir}/opt/${pkgname}/
  install -D icons/* ${pkgdir}/opt/${pkgname}/icons/
  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

}

# vim:set ts=2 sw=2 et:
