# Contributor: Ralf Barth <archlinux dot or at haggy dot org>
# Contributor: Richard Atkinson atkinsonr at gmail
#
# Suggestions for improvement welcome.

pkgname=xbmc-skin-minimeedia
pkgver=0.95
pkgrel=1
pkgdesc="MiniMeedia skin for XBMC"
arch=('i686' 'x86_64')
url="http://www.teamrazorfish.co.uk/"
source=('http://dump.haggy.org/aur/MiniMeedia_v'$pkgver'.zip')
depends=('xbmc')
makedepends=('unzip')
provides=()
groups=('multimedia')
license=('GPL')
md5sums=('254ac5ba6c877b2ccca09bdd252b2aa4')
options=()

build() {
    #Copy tree to share location
    mkdir -p $pkgdir/usr/share/xbmc/skin
    cp -r "$startdir/src/MiniMeedia" "$pkgdir/usr/share/xbmc/skin/"
}
