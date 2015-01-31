#Autor: Alexandre Minoshi(Almin-Soft Group)
#Maintainer: Alexandre Minoshi

pkgname=pacmanxg4-bin
pkgver=4.16.3
pkgrel=3
pkgdesc="Yet another GUI for pacman and yaourt. Depends neither GTK nor Qt, only X11"
options=('!strip')
arch=('i686' 'x86_64')
url="http://almin-soft.ru/index.php?programmy/pacmanxg/tags/pacmanxg"
license=('GPL2')

if [ "${CARCH}" = 'x86_64' ]; then
depends=('pacman' 'ssx' 'lib32-libx11' 'lib32-libxrender' 'lib32-gcc-libs')
elif [ "${CARCH}" = 'i686' ]; then
depends=('pacman' 'ssx' 'libx11' 'gcc-libs' 'libxrender')
fi

optdepends=(
	'curl: news and screenshots support'
	'yaourt: AUR support' 'lib32-libxft: antialiased problem fix for x64' 
	'pkgfile: pkgfile utility check' 'scrot: for making screenshots'
)

if [ "${CARCH}" = 'x86_64' ]; then
source=("pacmanxg_64.tar.bz2::http://almin-soft.fsay.net/data/files/pacmanxg/download.php?get=pacmanxg_64.tar.bz2")
elif [ "${CARCH}" = 'i686' ]; then
source=("pacmanxg.tar.bz2::http://almin-soft.fsay.net/data/files/pacmanxg/download.php?get=pacmanxg.tar.bz2")
fi

install=${pkgname}.install

package() {
  install -d $pkgdir/opt/Almin-Soft/pacmanxg
  install -Dm755 pacmanxg $pkgdir/opt/Almin-Soft/pacmanxg/pacmanxg
  install -Dm755 dizz.sh $pkgdir/opt/Almin-Soft/pacmanxg/dizz.sh
  install -Dm755 repacman $pkgdir/opt/Almin-Soft/pacmanxg/repacman

  install -Dm755 langs/de.lang $pkgdir/opt/Almin-Soft/pacmanxg/langs/de.lang
  install -Dm755 langs/en.lang $pkgdir/opt/Almin-Soft/pacmanxg/langs/en.lang
  install -Dm755 langs/es.lang $pkgdir/opt/Almin-Soft/pacmanxg/langs/es.lang
  install -Dm755 langs/fr.lang $pkgdir/opt/Almin-Soft/pacmanxg/langs/fr.lang
  install -Dm755 langs/gl.lang $pkgdir/opt/Almin-Soft/pacmanxg/langs/gl.lang
  install -Dm755 langs/ru.lang $pkgdir/opt/Almin-Soft/pacmanxg/langs/ru.lang
  install -Dm755 langs/el.lang $pkgdir/opt/Almin-Soft/pacmanxg/langs/el.lang
  install -Dm755 langs/pl.lang $pkgdir/opt/Almin-Soft/pacmanxg/langs/pl.lang
  install -Dm755 langs/ca.lang $pkgdir/opt/Almin-Soft/pacmanxg/langs/ca.lang
  install -Dm755 langs/pt-br.lang $pkgdir/opt/Almin-Soft/pacmanxg/langs/pt-br.lang

  install -Dm775 "themes/dusk (Chakra)" "$pkgdir/opt/Almin-Soft/themes/dusk (Chakra)"
  install -Dm775 "themes/Graybird-like (Bridge)" "$pkgdir/opt/Almin-Soft/themes/Graybird-like (Bridge)"
  install -Dm775 "themes/Menda-like (Manjaro 0.10)" "$pkgdir/opt/Almin-Soft/themes/Menda-like (Manjaro 0.10)"
  install -Dm775 "themes/Munix Frost Light (Antergos)" "$pkgdir/opt/Almin-Soft/themes/Munix Frost Light (Antergos)"
  install -Dm775 "themes/Oxigen-like (Netrunner)" "$pkgdir/opt/Almin-Soft/themes/Oxigen-like (Netrunner)"

  install -Dm644 pacmanxg.png $pkgdir/usr/share/pixmaps/pacmanxg.png
  install -Dm644 pacmanxg.desktop $pkgdir/usr/share/applications/pacmanxg.desktop
  install -d $srcdir/usr/bin/
}
if [ "${CARCH}" = "x86_64" ]; then
md5sums=('a3632a9221ef612ad3e049583ee6de09')
elif [ "${CARCH}" = "i686" ]; then
md5sums=('fe71326a86a4b18997eaf6f5349b347c')
fi
