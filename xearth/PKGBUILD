# Maintainer: Volker Schmidt <flashrom42 AT gmail DOT com>
# Contributor: MIZUNO J. Y. <http://p.mjy.name/pkg:xearth>

pkgname=xearth
pkgver=1.1
pkgrel=2
pkgdesc="replaces the X root window with an image of the Earth"
# alternate source depot at:
# http://fossies.org/linux/misc/old/xearth-1.1.tar.gz/
# download source code with:
# http://fossies.org/unix/misc/old/xearth-1.1.tar.gz
url='http://xearth.org/'
arch=('i686' 'x86_64')
license=('custom:xearth')
depends=('libxt' 'libx11' 'glibc')
makedepends=('make' 'gcc')
source=("http://xearth.org/${pkgname}-${pkgver}.tar.gz"
        'LICENSE')
md5sums=('6e409dffaa8dc5fae1064e38935ab61f'
         'a1c771420c821c601629eed256970fd5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -f Makefile.DIST || return 1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    gzip --name -9 --stdout xearth.man >xearth.1.gz
    install -D --strip xearth "${pkgdir}/usr/bin/xearth" || return 1
    install -D --mode ugo=r,u+w xearth.1.gz \
        "${pkgdir}/usr/share/man/man1/xearth.1.gz"
    install -D --mode ugo=r,u+w \
        ${srcdir}/LICENSE \
        "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    install -p --mode ugo=r,u+w \
        BUILT-IN \
	GAMMA-TEST \
	HISTORY \
	README \
        "${pkgdir}/usr/share/doc/${pkgname}"
}

