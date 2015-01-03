# Maintainer: Fabian Beuke fabianbeuke@gmail.com

pkgname=bdf-zeev-peep
pkgver=1.0
pkgrel=3
pkgdesc="This monospace font is designed for working comfortably on a high resolution display. It is heavily based on Jim Knobles neep-alt font."
arch=('i686' 'x86_64')
license=('MIT')
url="http://zevv.nl/play/code/zevv-peep/index.php"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=zeev-peep.install
source=(http://zevv.nl/play/code/zevv-peep/zevv-peep-iso8859-15-10x20.bdf)
md5sums=('aa3d198a50f20c2cb1284531f1228d80')

package() {
  install -Dm644 ${srcdir}/zevv-peep-iso8859-15-10x20.bdf \
	${pkgdir}/usr/share/fonts/misc/zevv-peep-iso8859-15-10x20.bdf
}

