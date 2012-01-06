# Maintainer: crazyelf5

pkgname=mint-z-theme
pkgver=1.1.4
pkgrel=1
pkgdesc="Linux Mint GTK theme based on Zukitwo, Faience, Adwaita, Faenza and others"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-z-theme"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engine-unico')
conflicts=($pkgname-git)
source=("$url/${pkgname}_${pkgver}.tar.gz")
md5sums=('b52a5fdd3429386651b0bcf930745269')

package() {
	cp -r "$srcdir/$pkgname/usr" "$pkgdir/"
}
