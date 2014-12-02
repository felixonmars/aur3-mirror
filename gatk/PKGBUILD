# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=gatk
pkgver=3.3
pkgrel=1
pkgdesc="The Genome Analysis Toolkit (GATK)"
realname="GenomeAnalysisTK.jar"
arch=('any')
url="https://www.broadinstitute.org/gatk"
license=('custom')
depends=('java-environment')
source=("file://GenomeAnalysisTK-${pkgver}-0.tar.bz2" "starter.sh")
md5sums=('e3d9d6e87825078d1a574c5bb469a1b4' '95092e155f939ef1ce452629bd32b449')

package() {
  install -D -m755 "${srcdir}/$realname" "${pkgdir}/opt/$pkgname/$realname"
  install -D -m755 "${srcdir}/starter.sh" "${pkgdir}/opt/$pkgname/starter.sh"
  install -D -m755 "${pkgdir}/opt/$pkgname/starter.sh" "${pkgdir}/usr/bin/${pkgname}"
}

