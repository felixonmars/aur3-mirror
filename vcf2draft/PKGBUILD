# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=vcf2draft
pkgver=2
pkgrel=1
pkgdesc="A tool to generate a draft genome out of a provided EMIT_ALL_SITES VCF file, filtering potential bad candidates."
realname="VCF2Draft$pkgver.jar"
arch=('any')
url="http://it.inf.uni-tuebingen.de/?page_id=161"
license=('custom')
depends=('jre7-openjdk')
source=("http://www-ps.informatik.uni-tuebingen.de/software/eager/VCF2Draft/VCF2Draft${pkgver}.jar" "http://www-ps.informatik.uni-tuebingen.de/software/eager/VCF2Draft/vcf2draft.sh")
noextract=("VCF2Draft${pkgver}.jar")
md5sums=('2128dde0b7fb8fd784133cf06d927d68' '40a49e7481bf9f3d57380157c45f92be')

package() {
  install -D -m755 "${srcdir}/$realname" "${pkgdir}/opt/$pkgname/$realname"
  install -D -m755 "${srcdir}/vcf2draft.sh" "${pkgdir}/opt/$pkgname/vcf2draft.sh"
  install -D -m755 "${pkgdir}/opt/$pkgname/vcf2draft.sh" "${pkgdir}/usr/bin/${pkgname}"
}

