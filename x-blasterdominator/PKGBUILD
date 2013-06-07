# Maintainer: Belosoukinski Jacques <shingo-san@live.jp>
pkgname=x-blasterdominator
pkgver=beta
pkgrel=0.4
changelog=changelog
epoch=
pkgdesc="A vertical scrolling shoot'em up 2D"
arch=('i686 x86_64')
url="http://injection-studio.com"
license=('privative')
install=${pkgname}.install
depends=(libsndfile openal freetype2 mesa libxrandr)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('x-blasterdominator-beta', 'x-blasterdominator-x64-beta', 'x-blasterdominator')
source=('http://injection-studio.com/download/x-blasterdominator/beta-0.4/linux/x-blasterdominator.tar.gz')
md5sums=('2e5737c87eb4a3a02db55c1bab7375cb')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "${pkgdir}"/opt/${pkgname}
	
	# Binary
	install -Dm 755 ${pkgname}.$CARCH "${pkgdir}/opt/${pkgname}/${pkgname}"

	# Data
	cp -r content "${pkgdir}/opt/${pkgname}"

	# Desktop file
	install -Dm 644 x-blasterdominator.desktop \
	"$pkgdir/usr/share/applications/x-blasterdominator.desktop"

	# Icons
  	for _i in 32 48 64 128; do
    	install -Dm 644 icons/${pkgname}-${_i}x${_i}.png \
      	"$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/${pkgname}.png"
  	done

}
