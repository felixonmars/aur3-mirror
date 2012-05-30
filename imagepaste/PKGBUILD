# Maintainer: Yuri Bochkarev <baltazar dot bz at gmail dot com>
_hkgname=imagepaste
pkgname=imagepaste
pkgver=0.2.0.1
pkgrel=1
pkgdesc="Command-line image paste utility"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
#makedepends=('ghc' 'haskell-http=4000.1.1' 'haskell-containers=0.4.0.0' 'haskell-json' 'haskell-mtl=2.0.1.0' 'haskell-network=2.3.0.2' 'haskell-regex-posix=0.94.4' 'haskell-tagsoup' 'haskell-template-haskell=2.5.0.0' 'haskell-transformers=0.2.2.0' 'haskell-vcs-revision')
makedepends=('ghc' 'haskell-http' 'haskell-containers' 'haskell-json' 'haskell-mtl' 'haskell-network' 'haskell-regex-posix' 'haskell-tagsoup' 'haskell-template-haskell' 'haskell-transformers' 'haskell-vcs-revision')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('a87d77cec6ef52c230b533966db6d56d')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
    ln -s ${pkgname} "${pkgdir}/usr/bin/imp"
}
