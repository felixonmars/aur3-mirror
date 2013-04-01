# Maintainer: Fernando Fernandez <fernando[at]softwareperonista[dot]com[dot]ar>
pkgname=miescritorio
pkgver=2.3.2
pkgrel=1
pkgdesc="Application with educational content to search, download and share resources"
url="http://www.educ.ar/recursos/ver?rec_id=105560"
arch=('i686' 'x86_64')
license=('Custom')
depends=('java-environment' 'libxrandr' 'fontconfig' 'glib2')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=$pkgname.install

source=("${pkgname}-${pkgver}.zip::http://www.educ.ar/repositorio/Download/file?file_id=65718c4a-feee-4d19-86df-c19d8f41554b&rec_id=105560"
        "miescritorio.sh"
        "miescritorio.desktop")

md5sums=('6d6b6c57d1418d162cc6fe4b0e9df78a'
         '31e4ac0a54b4e18e1a3fe0c6507e49a4'
         '3c6f1444096afd78ee5c13ca63057086')

build() {
  cd ${srcdir}
  ar -xf ${pkgname}-${pkgver}-i386.deb
  tar -xzvf data.tar.gz -C ${pkgdir}

  mkdir ${pkgdir}/usr/bin
  cp ${srcdir}/miescritorio.sh ${pkgdir}/usr/bin/miescritorio

  cp ${srcdir}/miescritorio.desktop ${pkgdir}/usr/share/applications/miescritorio.desktop  
  
  chown -R root:users ${pkgdir}/usr/share/miescritorio
  chmod -R g+w ${pkgdir}/usr/share/miescritorio
}

# vim:set ts=2 sw=2 et:
