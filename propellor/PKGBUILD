# Maintainer: Vincent Ambo <tazjin@gmail.com>
pkgname=propellor
pkgver=0.8.3
pkgrel=1
pkgdesc="Configuration management with Haskell and git"
arch=('x86_64')
url="https://propellor.branchable.com/"
license=('BSD')
depends=('git' 'gnupg' 'ghc' 'cabal-install')
source=("https://hackage.haskell.org/package/propellor-${pkgver}/propellor-${pkgver}.tar.gz")
md5sums=('b8b1415808dee239e033ce4c9f1eb78e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cabal sandbox init
    cabal update
    cabal install --only-dependencies
    cabal configure
    cabal build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 dist/build/propellor/propellor "${pkgdir}/usr/bin/propellor"
    install -Dm644 propellor.1 "${pkgdir}/usr/share/man/man1/propellor.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/propellor/LICENSE"
    install -Dm644 doc/README.mdwn "${pkgdir}/usr/share/doc/propellor/README.mdwn"
    install -m644 debian/changelog "${pkgdir}/usr/share/doc/propellor/changelog"
    
}
