# Maintainer: Andrew Trabo <v01d3r_at_gmail_dot_com>
# Contributor: gyo <gyo_at_archlinux_dot_fr>
pkgname=repacman-en
pkgver=0.98
pkgrel=2
pkgdesc="An english version of a tool for producing a pacman package from software's existing installation"
arch=('any')
url="http://archlinux.fr/repacman"
conflicts=('repacman')
license=('GPL')
_scriptname=repacman
source=("$pkgname-$pkgver.tar.gz")
md5sums=('9949ba440e8517401ebb2be7ef2c740d')

build() {
    mkdir -p $pkgdir/usr/bin/
    install -m755 $_scriptname $pkgdir/usr/bin/
}
