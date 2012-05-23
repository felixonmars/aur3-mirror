# Maintainer: mitsuse <mitsuset - gmail>
pkgname=python-mecab-testing
pkgver=0.993
pkgrel=3
pkgdesc="Morphological Analysis Tool - Python interface (for python3, unofficail)"
arch=('i686' 'x86_64')
url="http://mecab.sourceforge.net/"
license=('BSD' 'LGPL' 'GPL')
groups=()
depends=("python" "mecab")
makedepends=("gcc")
optdepends=()
provides=("python-mecab")
conflicts=("python-mecab")
replaces=("python-mecab")
backup=()
options=()
source=(
    "http://mecab.googlecode.com/files/mecab-python-$pkgver.tar.gz"
    "setup-for-py3.patch"
    "MeCab_wrap.cxx"
    "MeCab.py")
md5sums=(
    '4952d2e2030705436263012c32873bee'
    '2696dc0e225bb44e4e000674956df2a6'
    '950c0ca319fe85cad70ddd44d030dafb'
    'ab4457b2d01cf8b379f88214e674149f')
package() {
    patch $srcdir/mecab-python-$pkgver/setup.py < $srcdir/setup-for-py3.patch
    cp $srcdir/MeCab_wrap.cxx $srcdir/mecab-python-$pkgver/MeCab_wrap.cxx 
    cp $srcdir/MeCab.py $srcdir/mecab-python-$pkgver/MeCab.py 
    cd $srcdir/mecab-python-$pkgver
    python setup.py build
    python setup.py install --root=$pkgdir --optimize=1
}
