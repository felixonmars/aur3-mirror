# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=mauve
pkgver=2.4.0
pkgrel=2
pkgdesc="Mauve is a system for constructing multiple genome alignments in the presence of large-scale evolutionary events such as rearrangement and inversion. "
arch=('x86_64')
url="http://darlinglab.org/mauve/mauve.html"
license=('GPL')
depends=('java-runtime')
source=("http://darlinglab.org/mauve/downloads/mauve_linux_2.4.0.tar.gz" "starter.sh")
md5sums=('47eea9b8f7cb1186d517f19e34e9049b' '883ccb57a13ffd63055a4c4b65b3e762')


package() {
  install -dm755 "${srcdir}/${pkgname}_${pkgver}" "${pkgdir}/opt/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  cp -rv "${srcdir}/${pkgname}_${pkgver}/" "${pkgdir}/opt/"
  cd ${pkgdir}/usr/bin/
  ln -s "../../opt/${pkgname}_${pkgver}/linux-x64/mauveAligner"
  ln -s "../../opt/${pkgname}_${pkgver}/linux-x64/progressiveMauve"
  install -D -m755 "${srcdir}/starter.sh" "${pkgdir}/opt/$pkgname_${pkgver}/starter.sh"
  install -D -m755 "${pkgdir}/opt/$pkgname_${pkgver}/starter.sh" "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/mauveAligner"
  chmod +x "${pkgdir}/usr/bin/progressiveMauve"
}

