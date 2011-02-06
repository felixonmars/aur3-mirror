# Maintainer: Wu Yang <wuyangnju at gmail dot com>
pkgname=ttplyrics
pkgver=0.4
pkgrel=1
pkgdesc="A rhythmbox plugin downloading lyrics from ttplayer lyrics server"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ttplyrics/"
license=('GPL')
depends=('rhythmbox' 'python')
install=ttplyrics.install
source=(http://ttplyrics.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('98700c873058a4cf4e1380553d21b193')

build() {
    install -d ${pkgdir}/usr/lib/rhythmbox/plugins/ttplyrics
    install -Dm755 ${srcdir}/ttplyrics-0.4/ttplyrics/* ${pkgdir}/usr/lib/rhythmbox/plugins/ttplyrics/
}
