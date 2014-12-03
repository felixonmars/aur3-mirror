# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=betterrmdup
pkgver=0.8.8
pkgrel=1
pkgdesc="A better remove duplicates procedure than samtools rmdup."
realname="BetterRMDupv$pkgver.jar"
arch=('any')
url="http://it.inf.uni-tuebingen.de/?page_id=161"
license=('custom')
depends=('jre7-openjdk')
source=("http://www-ps.informatik.uni-tuebingen.de/software/eager/betterrmdup/BetterRMDupv0.8.8.jar" "starter.sh")
noextract=("BetterRMDupv0.8.8.jar")
md5sums=('2ac14182807e84de4a5fc12fc03d2b78' '7f306736f9e4e8b67e841cac7b7f7d5b')

package() {
  cd "$srcdir"
  install -D -m755 "${srcdir}/$realname" "${pkgdir}/opt/$pkgname/$realname"
  install -D -m755 "${srcdir}/starter.sh" "${pkgdir}/opt/$pkgname/starter.sh"
  install -D -m755 "${pkgdir}/opt/$pkgname/starter.sh" "${pkgdir}/usr/bin/${pkgname}"
}

