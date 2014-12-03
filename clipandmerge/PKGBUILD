# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=clipandmerge
pkgver=1.3
pkgrel=1
pkgdesc="An adaptor clipping and read merging tool written in Java."
realname="ClipAndMergev$pkgver.jar"
arch=('any')
url="http://it.inf.uni-tuebingen.de/?page_id=161"
license=('custom')
depends=('jre7-openjdk')
source=("http://www-ps.informatik.uni-tuebingen.de/software/eager/MergeScript/ClipAndMergev${pkgver}.jar" "starter.sh")
noextract=("ClipAndMergev${pkgver}.jar")
md5sums=('39a346a7326ba256166ba7805affe4cf' '7159f4a12ebf389d3208ab66f59d0b5a')

package() {
  install -D -m755 "${srcdir}/$realname" "${pkgdir}/opt/$pkgname/$realname"
  install -D -m755 "${srcdir}/starter.sh" "${pkgdir}/opt/$pkgname/starter.sh"
  install -D -m755 "${pkgdir}/opt/$pkgname/starter.sh" "${pkgdir}/usr/bin/ClipAndMerge"
}

