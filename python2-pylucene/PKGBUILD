# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jeremy Sands <cto@jeremysands.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=python2-pylucene
pkgver=4.4.0
pkgrel=2
pkgdesc="Use Lucene's text indexing and searching capabilities for Python"
arch=(i686 x86_64)
url=http://lucene.apache.org/${pkgname#*-}/
license=(MIT)
depends=(java-environment python2)
makedepends=(apache-ivy gcc-gcj python2-jcc)
source=(http://mirror.olnevhost.net/pub/apache/lucene/${pkgname#*-}/${pkgname#*-}-$pkgver-1-src.tar.gz)
sha256sums=('3d8c4ef09e8cea02601cf01e59ff020a258fc02384017ef436862ad989887dde')
sha512sums=('9d69c2574b69b22dd3f74dfbc8d63163d894408385fb35252b1d9907ad1c394b869b9369169a4e13c273a74ea2b07fba042a0bf1eece24d92ca2c8c17849612b')

build() {
    make -C ${pkgname#*-}-$pkgver-1 \
        -j1 \
        ANT=ant \
        PREFIX_PYTHON=/usr \
        PYTHON=python2 \
        JCC="python2 -m jcc" \
        NUM_FILES=8
}

package() {
    cd ${pkgname#*-}-$pkgver-1/
    export JCC_JDK=$JAVA_HOME
    (cd jcc/; NO_SHARED=true python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1)
    make -j1 DESTDIR="$pkgdir" install ANT=ant
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
