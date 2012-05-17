# Maintainer: Bernardo Barros <bbarros@xsounds.org>

pkgname=abjad
_realname=Abjad
pkgver=2.8
pkgrel=1
pkgdesc="a Python API for Formalized Score Control and Music Composition (by Víctor Adán, Trevor Baca and Josiah Oberholtzer)"
url="http://www.projectabjad.org"
arch=(any)
license=('GPL')
depends=('python2>=2.7' 'lilypond')
makedepends=('python2-distribute')
conflicts=('abjad-svn')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/A/Abjad/$_realname-$pkgver.tar.gz")
md5sums=('51b88f1dc4b5414f6ecae0511adb267d')

build() {
  cd $srcdir/$_realname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
}


