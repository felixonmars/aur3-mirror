pkgname=firefox-imglikeopera
pkgver=0.6.17
_firefox_ver=3.0
pkgrel=1
pkgdesc="plugin for firefox which shows/hides images"
arch=('i686' 'x86_64')
url="http://imglikeopera.mozdev.org/"
license=('GPL2')
depends=(firefox)
makedepends=('unzip')
source=(http://downloads.mozdev.org/imglikeopera/imglikeopera-$pkgver.xpi)
md5sums=('7e8bf15598b5bdd08f8befb0f89deac3')

build() {
    cd $srcdir		|| return 1
    #this method comes from gentoo (http://kambing.ui.edu/gentoo-portage/eclass/mozextension.eclass):
    local emid='imglikeopera@imfo.ru'
    local dstdir=$pkgdir/usr/lib/firefox-$_firefox_ver/extensions/${emid}
    install -d $dstdir		|| return 1
    cp -R * $dstdir		|| return 1
    rm $dstdir/imglikeopera-$pkgver.xpi
}
