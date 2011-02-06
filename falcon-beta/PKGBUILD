# Contributor: Corey Clayton --- can.of.tuna<at>[google's mail service] :)
pkgname=falcon-beta
pkgver=0.9.4.2
pkgbasever=0.9.4.2
pkgrel=1
pkgdesc="A dynamic, VM based language desiged to be simple, fast and powerful, and to be embedable as a scripting engine ready to empower mission-critical multithreaded applications. (Bleeding Edge release)"
license=('custom:"GPLv2 or Falcon Programming Language License"')
url="http://www.falconpl.org"
source=(http://www.falconpl.org/project_dl/_official_rel/Falcon-0.9.4.2.tar.gz)
md5sums=('00d19cef885e25bcbf8851add5bd0528')
arch=(i686 x86_64)
makedepends=('cmake')
depends=('zlib' 'pcre' 'bison')
provides=('falcon')

build() {
    cd $startdir/src/Falcon-$pkgbasever
    ./build.sh -p $startdir/pkg/usr -f /usr -i || return 1
    mkdir -p $startdir/pkg/usr/share/licenses/falcon || return 1
    cp LICENSE $startdir/pkg/usr/share/licenses/falcon || return 1
}

