# Maintainer: DavidK <david_king at softhome dot net>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
pkgname=edumips64
pkgver=1.2
pkgrel=2
pkgdesc="A MIPS64 instruction set simulator written in Java/Swing"
arch=('i686' 'x86_64')
url="http://www.edumips.org"
license=('GPL')
depends=('sh' 'java-runtime')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.jar \
        $pkgname.sh)
noextract=($pkgname-$pkgver.jar)
md5sums=('f4abf4eda8f808769e1f10cbf823b6b5'
         '7d58afc7d392b69650458b81e0425a0d')

package() {
  install -D -m644 $pkgname-$pkgver.jar "${pkgdir}/usr/share/java/$pkgname/$pkgname.jar" || return 1
  install -D -m755 $pkgname.sh "${pkgdir}/usr/bin/$pkgname" || return 1
}
