# Mantainer: TheScorpion <thescorpion@hotmail.com.ar>

pkgname=kdeicons-oxygen-old
pkgver=1.0
pkgrel=1
pkgdesc="For those who don't like pending 4.7 icon change."
arch=('any')
depends=()
url="http://kde-look.org/content/show.php/Oxygen+Old+(before+4.6.2)?content=142662&PHPSESSID=e4d3b677f4e29c36abe067a3eaaff498"
license=('GPL')
source=(http://content.wuala.com/contents/csslayer/eyecandy/icons/oxygen-old.tar.bz2)
md5sums=('2d806a4f5350985ab4a1e0a381cefbdc')

package() {
install -d ${pkgdir}/usr/share/icons
cp -ar ${srcdir}/oxygen-old ${pkgdir}/usr/share/icons/
} 
