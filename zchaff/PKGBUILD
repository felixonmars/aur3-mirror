# Maintainer: buhman <zack[at]buhman[dot]org>
pkgname=zchaff
pkgver=2008.10.12
pkgrel=2
pkgdesc='an implementation of the Chaff algorithm.'
url='http://www.princeton.edu/~chaff/zchaff.html'
license='custom:princeton'
arch=('x86_64' 'i686')
source=("http://www.princeton.edu/~chaff/${pkgname}/${pkgname}.${pkgver}.zip")
md5sums=('7398b3e984a5046755cb3ef6b0e44d2e')

build() {
    cd "${srcdir}/${pkgname}"

    # remove upstream stupidity; don't pass MFLAGS to gcc: http://www.gnu.org/software/make/manual/make.html#index-MFLAGS-431
    sed -i 's/ $(MFLAGS)//' Makefile

    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 zchaff "${pkgdir}/usr/bin/zchaff"
}
