# Maintainer: David Serrano <david.ma.serrano@gmail.com> 

pkgname=potato-git
pkgver=0.0.0
pkgrel=2
pkgdesc="Potato racer"
arch=('i686' 'x86_64' 'armv6h')
url="https://bitbucket.org/N0_Named_Guy/potato"
license=('GPL')
depends=('sdl' 'glew' 'mesa')
makedepends=('git' 'premake4' 'make' 'gcc' 'glm')
conflicts=('potato')
provides=('potato')
source=("$pkgname"::'git+http://bitbucket.org/N0_Named_Guy/potato.git'
        potato)
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP'
        'c72bbc7d354c3b6eca91065d523c3b18')

pkgver() {
	cd "$pkgname"
	# Use the tag of the last commit
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

build() {
    cd ${srcdir}/${pkgname}
    premake4 gmake
	make -j2
}

package() {
	cd "$pkgname"
    mkdir -p $pkgdir/usr/share/potato
    cp -r ${srcdir}/${pkgname}/data $pkgdir/usr/share/potato

    install -Dm644 ${srcdir}/${pkgname}/config.json $pkgdir/usr/share/potato/config.json
    install -Dm755 ${srcdir}/${pkgname}/Potato $pkgdir/usr/bin/potato-bin
    install -Dm755 ${srcdir}/potato $pkgdir/usr/bin/potato
}
