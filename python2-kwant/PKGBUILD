# Maintainer: Max Schlemmer <max.schlemmer@gmail.com>
pkgname=python2-kwant
pkgver=1.0.2
pkgrel=1
pkgdesc="Python package for numerical calculations on tight-binding models with a strong focus on quantum transport"
arch=('any')
url="http://kwant-project.org/"
license=('custom')
depends=(python2 python2-scipy lapack blas python2-tinyarray)
optdepends=(
	'python2-nose: testing support'
	'python2-matplotlib: plotting support'
	'mumps: speed up'
)
source=(
	http://downloads.kwant-project.org/kwant/kwant-$pkgver.tar.gz
	http://downloads.kwant-project.org/kwant/kwant-$pkgver.tar.gz.sig
)
md5sums=(
	'df2649a76758d5a4c5956c8b3d5c8ad5'
	'SKIP'
)

build() {
    cd "$srcdir/kwant-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/kwant-$pkgver"
    python2 setup.py install --skip-build -O1 --root="$pkgdir" --optimize=1
    
    # Install license
    install -D -m644 "${srcdir}/kwant-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}
