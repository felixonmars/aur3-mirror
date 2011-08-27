# Contributor: Abdallah Aly < l3thal8 @gmail.com >
pkgname=falcon-gd2
pkgver=1.0.0
pkgrel=1
pkgdesc="the GD2 module for Falcon proramming language"
license=('custom:"GPLv2 or Falcon Programming Language License"')
url="http://www.falconpl.org"
source=(http://www.falconpl.org/project_dl/gd2/Falcon-gd2.$pkgver.tgz)
md5sums=('40fff6763de16095f3374f36a8630371')
arch=(i686 x86_64)
makedepends=('cmake')
depends=('falcon' 'gd')
provides=('falcon-gd2')

build() {
    cd $startdir/src/Falcon-gd2.$pkgver
    cmake . || return 1
    make || return 1
    mkdir -p $startdir/pkg/usr/lib/falcon || return 1
    make DESTDIR="$startdir/pkg/" install || return 1
    mkdir -p $startdir/pkg/usr/share/licenses/falcon || return 1
    cp LICENSE $startdir/pkg/usr/share/licenses/falcon/falcon-dynlib || return 1
}

