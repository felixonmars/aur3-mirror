# Maintainer: Ryan Peters <sloshy45 _AT_ sbcglobal _DOT_ net>
# Special thanks to the Linux Mint project; without them this would not exist.
pkgname=mint-artwork-gnome
pkgver=2.6.9
pkgrel=4
pkgdesc="Linux Mint GNOME artwork and themes"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mint-artwork-gnome"
license=('GPL')
depends=('gtk-aurora-engine' 'gtk-candido-engine' 'gtk-engine-murrine-git' 'gtk-theme-shiki-colors' 'gnome-colors-icon-theme' 'mint-x-icons' 'mint-x-theme')
optdepends=("mint-backgrounds-julia: Linux Mint 10's backgrounds"
	    "mint-backgrounds-isadora: Linux Mint 9's backgrounds"
	    "mint-backgrounds-helena: Linux Mint 8's backgrounds")
source=("${url}/${pkgname}_${pkgver}.tar.gz")
md5sums=('c86f9815325d2777151d3a85d034278d')

build() {
  cd "$srcdir/${pkgname}-2.6.7"
  cp -R usr $pkgdir/
}
# vim:syntax=sh
