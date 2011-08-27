##
# Maintainer: Todd Harbour <aur @AT@ quadronyx .DOT. org>
# Comments: 
# Binary version available from: http://www.quadronyx.org/aur/
##

pkgname=viftool
pkgver=1.3
pkgrel=1
pkgdesc="Tool for splitting and joining TomTom .chk/.vif voice files"
url="http://www.ghostwheel.de/viftool"
arch=("i686" "x86_64")
license=("unknown")
depends=( \
	'python' \
	)
source=( \
	"$url/$pkgname.$pkgver.py" \
	)
md5sums=( \
	'2e0e8a4ff12295986496416eb6a79924' \
	)

build() {
  cd ${startdir}/src/ || return 1
  mkdir -p ${startdir}/pkg/usr/bin/ || return 1
  install -m755 ${pkgname}.${pkgver}.py ${startdir}/pkg/usr/bin/ || return 1
  ln -s ${pkgname}.${pkgver}.py ${startdir}/pkg/usr/bin/${pkgname} || return 1
}
