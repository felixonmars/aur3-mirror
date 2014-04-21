# Maintainer: Ken Hasselmann <arch@kenh.fr>

pkgname=phonetisaurus
pkgver=0.7.8
pkgrel=1
pkgdesc="WFST-driven grapheme-to-phoneme (g2p) framework suitable for rapid development of high quality g2p or p2g systems."
arch=('any')
url="https://code.google.com/p/phonetisaurus"
license=('NEW BSD')
makedepends=('gcc')
depends=('openfst' 'python2>=2.7.1')
optdepends=('mitlm')
source=("https://phonetisaurus.googlecode.com/files/${pkgname}-${pkgver}.tgz")
md5sums=('eec697af2653ea4b81eb411b4346dc0b')

build() {
    cd "$srcdir/$pkgname-$pkgver/src"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir "$pkgdir/usr"
    mkdir "$pkgdir/usr/share"
    mkdir "$pkgdir/usr/share/$pkgname"
    mkdir "$pkgdir/usr/bin"
    cp phonetisaurus-align  phonetisaurus-arpa2fst phonetisaurus-arpa2wfst-omega phonetisaurus-g2p phonetisaurus-g2p-omega "$pkgdir/usr/bin/"
    cp -r script/ "$pkgdir/usr/share/$pkgname/"
    cp -r tests/ "$pkgdir/usr/share/$pkgname/"
    cp README.txt "$pkgdir/usr/share/$pkgname/"
}
