# Contributor: kkb110 <kkb110@gmail.com>
pkgname=pygccxml-old
pkgver=0.9.5
pkgrel=3
pkgdesc="The purpose of pygccxml is to read a generated file and provide a simple framework to navigate C++ declarations, using Python classes."
arch=('i686' 'x86_64')
url="http://www.language-binding.net/pygccxml/pygccxml.html"
replaces=('pygccxml')
license=('custom')
depends=('gccxml-cvs' 'python2')
options=(!strip)

source=(http://jaist.dl.sourceforge.net/sourceforge/pygccxml/pygccxml-${pkgver}.zip)

md5sums=('865ed1d62eed19c9e7509c137a0ee582')


build() {
  cd "$srcdir/pygccxml-${pkgver}"

  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root=$startdir/pkg

}
