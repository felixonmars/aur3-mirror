#Autor: Alexandre Minoshi(Almin-Soft Group)
#Maintainer: Alexandre Minoshi

pkgname=pacmanxg-bin
pkgver=2.21
pkgrel=1
pkgdesc="Yet another GUI for pacman and yaourt. Not depends either GTK, Qt"
options=('!strip')
arch=('i686' 'x86_64')
url="http://almin-soft.nx0.ru/openiandifree/pacmanxg.html"
license=('GPL2')
if [ "${CARCH}" = 'x86_64' ]; then
depends=('pacman' 'lib32-libx11' 'lib32-gcc-libs')
elif [ "${CARCH}" = 'i686' ]; then
depends=('pacman' 'libx11' 'gcc-libs')
fi
optdepends=('xdg-su: for GUI enter pass'
'yaourt: AUR support' 'lib32-libxft: antialiased problem fix')
source=("http://almin-soft.nx0.ru/media/files/binaries/pacmanXG.tar.bz2"
	"pacmanxg.desktop")

package() {
  install -d $pkgdir/opt/pacmanxg
  install -Dm755 pacmanXG $pkgdir/opt/pacmanxg/pacmanxg
  install -Dm644 icon.png $pkgdir/usr/share/pixmaps/pacmanxg.png
  install -Dm644 pacmanxg.desktop $pkgdir/usr/share/applications/pacmanxg.desktop
}


md5sums=('2508b750b1da6e925b0c621bd78cdfce'
         '6be794ae989783e0605db6cc67ab74b0')
