# Maintainer: Paolo Herms

pkgname=kdeplasma-applets-netnewsticker
pkgver=0.8.8
pkgrel=3
pkgdesc="KDE Plasma widget that indicates available RSS-feeds as a horizontal or vertical scrolling text"
url="http://netnewsticker.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('hicolor-icon-theme' 'kdepimlibs')
install=install
replaces=('kdeplasma-addons-applets-netnewsticker')
conflicts=('kdeplasma-addons-applets-netnewsticker')
makedepends=('rpmextract')
source=("http://netnewsticker.org/downloads/plasma-applet-netnewsticker-"$pkgver"-2010."${CARCH/686/386}".rpm")
case $CARCH in
    i686)   md5sums=('97d23d46bfaeb899cfe028d96714b6e1');;
    x86_64) md5sums=('aa0ba2aa269cb8790a8a62e3ce92923a');;
esac

build() {
    cd "$pkgdir"
    rpmextract.sh "$srcdir/`basename "$source"`"
}
