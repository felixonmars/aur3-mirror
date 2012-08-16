# Maintainer: erdbeer
pkgname=fluxbox-style-erdbeer
pkgver=0
pkgrel=0
pkgdesc="erdbeer's fluxbox theme"
url="https://aur.archlinux.org/packages.php?ID=61869"
arch=('i686' 'x86_64')
depends=('fluxbox')
license=('none')
source=('theme.cfg' 'close_focus.xpm' 'close_pressed.xpm' 'close_unfocus.xpm' 'iconify_focus.xpm' 'iconify_pressed.xpm' 'iconify_unfocus.xpm')
md5sums=('0a26067cf1bc6579f2afc0862d590342' '0dad9527007d913d1e3031f4049ac750' '31377269cebbc5c5098d3d56ee6afbee' 'd5b5dac66d07ac9094f366eaf25325e2' '50d033d137b506b6fc45ba7130c81ce9' 'f0de1186ff7750ea0d3a698d75c99aa4' '4984e6dfed2f3fa1704f7f82432459d0')

package() {
  mkdir -p ${pkgdir}/usr/share/fluxbox/styles/erdbeer/pixmaps
  cp theme.cfg ${pkgdir}/usr/share/fluxbox/styles/erdbeer/
  cp *.xpm ${pkgdir}/usr/share/fluxbox/styles/erdbeer/pixmaps/
}
