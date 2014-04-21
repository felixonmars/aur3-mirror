# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=qmotion
pkgver=3.0
pkgrel=1
pkgdesc="A Qt4-based motion detection application for webcams"
arch=('i686' 'x86_64')
url="http://slist.lilotux.net/linux/$pkgname/"
license=('GPL3')
depends=('qt4' 'opencv')
source=($url/$pkgname-$pkgver.tgz)
md5sums=('ced8f23aa6e432eed02a192c5324c3a7')
build() {
  cd $pkgname-$pkgver

  qmake
  make || return 1
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
