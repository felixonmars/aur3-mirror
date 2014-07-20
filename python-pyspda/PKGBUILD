# Submitter: Simon Conseil <contact+aur at saimon dot org>
# Submitter: Jesus Alvarez
# Maintainer: Danilo Bargen <gezuru@gmail.com>

pkgname='python-pyspda'
pkgver=0.2.5a
_pkgver=0.2.5
pkgrel=1
pkgdesc="Awesome autocompletion for python"
arch=('any')
url="https://tts.polip.com/"
license=('MIT')
depends=('python2' 'libao')
source=("http://tts.polip.com/files/sapi/python-pyspda_${pkgver}.tar.gz")

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
md5sums=('ef99f6e43416d58b42b53a492779f00e')
