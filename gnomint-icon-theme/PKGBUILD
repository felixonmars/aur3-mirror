# Maintainer: GreenRaccoon23 <GreenRaccoon23@gmail.com>

pkgname=gnomint-icon-theme
pkgver=3
pkgrel=3
pkgdesc="GNOME icon theme with Mint-X folder icons"
arch=('any')
url="https://launchpad.net/gnomint-icon-theme"
license=('GPL3')
depends=('gnome-icon-theme')
source=("https://launchpad.net/${pkgname}/trunk/${pkgver}.0/+download/${pkgname}-${pkgver}.tar.gz")
install='gnomint.install'
md5sums=('b35ef6067cdefa5e233296fba79007df')

package() {
  cd "$srcdir/gnomint"
  mkdir -p $pkgdir/usr/share/icons/gnomint
  # Installing icons
  cp -R $srcdir/gnomint/* $pkgdir/usr/share/icons/gnomint/
}
