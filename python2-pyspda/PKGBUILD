# Submitter: José Neder <jlneder at gmail dot com>
# Maintainer: José Neder <jlneder at gmail dot com>

pkgname='python2-pyspda'
pkgver=0.2.5a
_pkgver=0.2.5
pkgrel=1
pkgdesc="pyspda python2 module for sapi4linux text to speech"
arch=('any')
url="https://tts.polip.com/"
license=('MIT')
depends=('python2' 'libao')
source=("http://tts.polip.com/files/sapi/python-pyspda_${pkgver}.tar.gz")
md5sums=('ef99f6e43416d58b42b53a492779f00e')

build() {
    cd "$srcdir/python-pyspda-${_pkgver}"
    sed -i 's/python /python2 /' Makefile.in
    sed -i 's/--install-layout=$(layout)//' Makefile.in
    sed -i 's/python /python2 /' setup.py
    sed -i 's/python /python2 /' test.py
    ./configure --prefix="$pkgdir/usr"
    make
}

check() {
    cd "$srcdir/python-pyspda-${_pkgver}"
    #make audio_test
}

package() {
    cd "$srcdir/python-pyspda-${_pkgver}"
    make install
}

# vim:set ts=2 sw=2 et
