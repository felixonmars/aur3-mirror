# Maintainer: Belosoukinski Jacques <shingo-san@live.jp>
pkgname=x-blasterdominator-beta
pkgver=0
pkgrel=2
epoch=
pkgdesc="A vertical scrolling shoot'em up 2D"
arch=('i686 x86_64')
url="http://injection-studio.com"
license=('privative')
install=${pkgname}.install
depends=('sfml')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('x-blasterdominator-beta', 'x-blasterdominator-x64-beta')
source=('http://injection-studio.com/download/x-blasterdominator/beta-0.2/linux/x-blasterdominator-beta.tar')
md5sums=('3e2aa67bc846a4dbe82afdddaf07d86e') #generate with 'makepkg -g'

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "${pkgdir}"/usr/share/${pkgname}
	
	# Binary
	install -Dm 755 ${pkgname} "${pkgdir}/usr/share/${pkgname}"

	# Data
	cp -r content "${pkgdir}/usr/share/${pkgname}"

	# Desktop file
	install -Dm 644 x-blasterdominator-beta.desktop \
	"$pkgdir/usr/share/applications/x-blasterdominator-beta.desktop"

	# Icons
  	for _i in 32 48 64 128; do
    	install -Dm 644 icons/${pkgname}-${_i}x${_i}.png \
      	"$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/${pkgname}.png"
  	done

}
