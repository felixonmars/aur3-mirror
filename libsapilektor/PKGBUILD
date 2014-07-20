# Submitter: José Neder <jlneder at gmail dot com>
# Maintainer: José Neder <jlneder at gmail dot com>

pkgname='libsapilektor'
pkgver=0.1.10
pkgrel=1
pkgdesc="Sapi4Linux text to speech client library"
arch=('any')
url="http://sapi4linux.polip.com/"
license=()
depends=()
source=("http://tts.polip.com/files/sapi/libsapilektor_${pkgver}.orig.tar.gz")
md5sums=('b7074efb81d9ff2fb5a1bc64c3fb8667')
install='libsapilektor.install'

build() {
    cd "$srcdir/libsapilektor"
    make prefix=/usr
    for i in sapiconfig sapilektor sapitest
    do
        sed -i 's/env python/env python2/' $i
    done
}

check() {
    cd "$srcdir/libsapilektor"
}

package() {
    cd "$srcdir/libsapilektor"
    make "mode=builder" "prefix=$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et
