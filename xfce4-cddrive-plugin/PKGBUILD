# Contributor: Clément DEMOULINS <cdemoulins@gmail.com>

pkgname=xfce4-cddrive-plugin
pkgver=0.0.1
pkgrel=1
pkgdesc="This plugin puts a button in the panel to open or close a CD-ROM drive tray."
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-cddrive-plugin"
license=('GPL3')
depends=('libcdio' 'exo' 'xfce4-panel')
makedepends=('pkgconfig')

source=(http://goodies.xfce.org/releases/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('ccb2727a1e78ecb4f375a2eecae39e1d')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}


