# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Bernardo Barros <mail AT bbarros.com>

pkgname=abjad
_realname=Abjad
pkgver=2.5
pkgrel=1
pkgdesc="a Python API for Formalized Score Control and Music Composition (by Víctor Adán, Trevor Baca and Josiah Oberholtzer)"
url="http://www.projectabjad.org"
arch=(any)
license=('GPL')
depends=('python2' 'lilypond')
makedepends=('python2-distribute')
conflicts=('abjad-svn')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/A/Abjad/$_realname-$pkgver.tar.gz")
md5sums=('06d1c42ecd21cb81ac7bcfa6cfceda77')

build() {

    cd $srcdir/$_realname-$pkgver
    python2 setup.py install --root=$pkgdir/ --optimize=1
}
