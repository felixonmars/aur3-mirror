# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=fastqc
upname=FastQC
pkgver=0.11.2
pkgrel=4
pkgdesc="A quality control tool for high throughput sequence data."
arch=('any')
url="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/"
license=('GPLv3')
depends=('java-runtime>=6' 'sh')
source=("http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.2.zip")
md5sums=('8686e180a2d7c818821eb7db194d9488')


package() {
  install -dm755 "${srcdir}/${upname}" "${pkgdir}/opt/${upname}"
  install -dm755 "${pkgdir}/usr/bin"
  cp -rv "${srcdir}/${upname}" "${pkgdir}/opt/"
  cd ${pkgdir}/usr/bin/
  ln -s "../../opt/${upname}/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"
}

