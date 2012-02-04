# Contributor: Abdallah Aly < l3thal8 @gmail.com >
pkgname=falcon-dbi
pkgver=0.9.10
pkgrel=1
pkgdesc="the DataBase Interface module for Falcon proramming language"
license=('custom:"GPLv2 or Falcon Programming Language License"')
url="http://www.falconpl.org"
source=(http://www.falconpl.org/project_dl/dbi/Falcon-dbi-$pkgver.tgz)
md5sums=('a40bd695ded3f4bb286d668183ab5e09')
arch=(i686 x86_64)
makedepends=('cmake')
depends=('falcon')
provides=('falcon-sdl')

build() {
    cd $startdir/src/Falcon-dbi-$pkgver
    cmake . || return 1
    make || return 1
    mkdir -p $startdir/pkg/usr/lib/falcon || return 1
    make DESTDIR="$startdir/pkg/" install || return 1
    mkdir -p $startdir/pkg/usr/share/licenses/falcon || return 1
    cp LICENSE $startdir/pkg/usr/share/licenses/falcon/falcon-dbi || return 1
}

