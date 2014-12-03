# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=bam2tdf
pkgver=14
pkgrel=1
pkgdesc="A tool to convert BAM files to TDF format for viewing with IGV or other similar tools."
arch=('any')
url="http://genomeview.org/manual/Bam2tdf"
license=('custom')
depends=('jre7-openjdk')
source=("http://genomeview.org/jenkins/bam2tdf-nightly/bam2tdf-${pkgver}.zip" "starter.sh")
noextract=("bam2tdf-${pkgver}.jar")
md5sums=('0779625cd8ec721d40eb1c80adb94f68' '21ef583b857d6575e9a28ba92bd068e7')

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}/opt/"
  for f in *.jar ; do
   install -Dm755 $f ${pkgdir}/opt/$pkgname/$f
  done
  install -Dm755 "${srcdir}/starter.sh" "${pkgdir}/opt/$pkgname/starter.sh"
  install -Dm755 "${pkgdir}/opt/$pkgname/starter.sh" "${pkgdir}/usr/bin/${pkgname}"
}

