# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=sdldotnet
pkgver=6.1.0
pkgrel=2
pkgdesc="Object-oriented CLS-compliant .NET bindings for the SDL library"
arch=(i686 x86_64)
url="http://cs-sdl.sourceforge.net/"
license=('LGPL')
depends=('mono>=1.9' 'sdl>=1.2.13' 'sdl_image' 'sdl_mixer' 'sdl_ttf'
'sdl_gfx' 'smpeg')
source=(http://downloads.sourceforge.net/cs-sdl/$pkgname-$pkgver.tar.gz)
md5sums=('978c4bdb75e24b2c5dcef9c328168143')

build() {
    mkdir -p $pkgdir/usr/lib || return 1
    install -m644 $srcdir/$pkgname-$pkgver/bin/*{dll,config} \
    $pkgdir/usr/lib || return 1
}
