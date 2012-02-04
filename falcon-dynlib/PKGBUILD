# Contributor: Abdallah Aly < l3thal8 @gmail.com >
pkgname=falcon-dynlib
pkgver=0.9.5
pkgrel=1
pkgdesc="the Dynamic Library Binder module for Falcon proramming language"
license=('custom:"GPLv2 or Falcon Programming Language License"')
url="http://www.falconpl.org"
source=(http://www.falconpl.org/project_dl/dynlib/dynlib-$pkgver.tgz)
md5sums=('8046c29b6e3aa050f0e9c936b1e53cf7')
arch=(i686 x86_64)
makedepends=('cmake')
depends=('falcon')
provides=('falcon-dynlib')

build() {
    cd $startdir/src/dynlib-$pkgver
    cmake . || return 1
    make || return 1
    mkdir -p $startdir/pkg/usr/lib/falcon || return 1
    make DESTDIR="$startdir/pkg/" install || return 1
    mkdir -p $startdir/pkg/usr/share/licenses/falcon || return 1
    cp LICENSE $startdir/pkg/usr/share/licenses/falcon/falcon-dynlib || return 1
}

