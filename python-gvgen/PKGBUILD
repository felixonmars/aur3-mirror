# Contributor: Han Xiao <arak.hx@gmail.com>

pkgname=python-gvgen
pkgver=0.9
pkgrel=1
pkgdesc="GvGen is a python class to generate dot files for further use with graphviz. "
arch=('i686')
license=('GPL')
url="http://software.inl.fr/trac/wiki/GvGen"
source=("http://software.inl.fr/releases/GvGen/gvgen-$pkgver.tar.gz")
md5sums=('70a5bd64e2de53988d7ffabc93aebf27')

build() {
    cd $startdir/src/gvgen-$pkgver
    python setup.py build || return 1
    python setup.py install --prefix=/usr --root=$startdir/pkg
}
