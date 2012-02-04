#Contributors: Pardi Tommaso <homer.j.simson.bis@gmail.com>
#              Jonas Haag <jonas@lophus.org> (auto hide tab bar version)

pkgname=evilvte-hidetab
_pkgname=evilvte # previous pkgname
pkgver=0.4.7~pre3
pkgrel=1
pkgdesc='VTE based, highly customizable terminal emulator (configured to auto-hide tab bar)'
arch=('i686' 'x86_64')
url='http://www.calno.com/evilvte/'
license=('GPL2')
depends=('vte')
source=("http://www.calno.com/evilvte/${_pkgname}-${pkgver}.tar.gz")
md5sums=('7a93aa107f20c0db017e00d71762bff2')

# compatibility
replaces=('evilvte')

build(){
    cd $srcdir/${_pkgname}-${pkgver}
    ./configure --prefix=/usr || return 1
    sed -i "s/\/\/ \(#define TABBAR_AUTOHIDE\)/\1   /" src/config.h # uncomment
    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
    make clean
    # License not found in 4.6~pre6?
    # install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/${_pkgname}/LICENSE
}
