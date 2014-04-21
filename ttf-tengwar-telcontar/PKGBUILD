# Maintainer: lucy <lucy@luz.lu>
pkgname=ttf-tengwar-telcontar
pkgver=0.08
pkgrel=1
pkgdesc="A font part of the Free Tengwar Font Project. Utilizes smart rendering with Graphite."
arch=('any')
url="http://freetengwar.sourceforge.net/tengtelc.html"
license=('GPL3')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=('http://downloads.sourceforge.net/project/freetengwar/TengwarFont/TengwarTelcontar.008.zip')
sha256sums=('f88780510e5c14f66e252fabce5d58febc7bec962d5c17f21ac82002ce85b925')

package() {
    cd "$srcdir"
    install -Dm644 tengtelcb.ttf "$pkgdir/usr/share/fonts/TTF/tengtelcb.ttf"
    install -Dm644 tengtelc.ttf  "$pkgdir/usr/share/fonts/TTF/tengtelc.ttf"
    install -Dm644 README.txt    "$pkgdir/usr/share/doc/$pkgname/README.txt"
}

