# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=preseq
pkgver=1.0.2
pkgrel=1
pkgdesc="A tool for predicting and estimating the complexity of a genomic sequencing library, equivalent to predicting and estimating the number of redundant reads from a given sequencing depth."
arch=('x86_64')
url="http://smithlabresearch.org/software/preseq/"
license=('GPLv3')
source=("http://smithlabresearch.org/downloads/preseq-1.0.2.Linux_x86_64.tar.gz" "starter.sh")
md5sums=('192fc1cbef3a5dc4686567990239aaa2' '56905e0df3d2be797989119fa51d74ee')

package() {
  mkdir -p "${pkgdir}/opt/"
  mkdir -p "${pkgdir}/usr/bin/"
  cp -rv "${srcdir}/${pkgname}-${pkgver}.Linux_x86_64" ${pkgdir}/opt/
  install -Dm755 "${srcdir}/starter.sh" "${pkgdir}/opt/${pkgname}-${pkgver}.Linux_x86_64/starter.sh"
  install -Dm755 "${pkgdir}/opt/${pkgname}-${pkgver}.Linux_x86_64/starter.sh" "${pkgdir}/usr/bin/${pkgname}"
}

