# Contributor: Peter Kosyh <p.kosyhgmail.com>
pkgname=color-lines
pkgver=0.6
pkgrel=1
pkgdesc="Color lines game written with SDL with bonus features. "
arch=('i686' 'x86_64')
url="http://color-lines.googlecode.com/"
license=('GPL')

depends=('sdl' 'sdl_image' 'sdl_mixer')
makedepends=( 'pkgconfig' )

source=(http://color-lines.googlecode.com/files/lines_$pkgver.tar.gz)
md5sums=(f4ef0dd6969670ef62d41ed4f0f3f98b)

build() {
cd $startdir/src/lines-$pkgver
make BINDIR=/usr/bin/ PREFIX=/usr GAMEDATADIR=/usr/share/color-lines/ || return 1.
make GAMEDATADIR=${startdir}/pkg/usr/share/color-lines/ DESTDIR=${startdir}/pkg PREFIX=/usr BINDIR=${startdir}/pkg/usr/bin/ install
}
