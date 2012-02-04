# Contributor: Abdallah Aly < l3thal8 @gmail.com >
pkgname=falcon-sdl
pkgver=0.9.12
pkgrel=1
pkgdesc="the SDL module for Falcon proramming language"
license=('custom:"GPLv2 or Falcon Programming Language License"')
url="http://www.falconpl.org"
source=(http://www.falconpl.org/project_dl/sdl/Falcon-sdl-$pkgver.tgz)
md5sums=('f87b3e5ed57e38d5faf230a44c9c0b66')
arch=(i686 x86_64)
makedepends=('cmake')
depends=('falcon' 'sdl' 'sdl_gfx' 'sdl_sound' 'sdl_mixer' 'sdl_image' 'sdl_ttf' )
provide=('falcon-sdl')

build() {
    cd $startdir/src/Falcon-sdl-$pkgver
    cmake . || return 1
    make || return 1
    mkdir -p $startdir/pkg/usr/lib/falcon || return 1
    make DESTDIR="$startdir/pkg/" install || return 1
    mkdir -p $startdir/pkg/usr/share/licenses/falcon || return 1
    cp LICENSE $startdir/pkg/usr/share/licenses/falcon/falcon-sdl || return 1
}

