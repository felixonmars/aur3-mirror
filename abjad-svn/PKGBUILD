# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=abjad-svn
_realname=abjad
pkgver=4306
pkgrel=1
pkgdesc="Abjad: a Python API for Formalized Score Control"
url="http://code.google.com/p/abjad/"
arch=('any')
license=('GPL')
depends=('python2' 'lilypond')
conflicts=('abjad')
provides=('abjad')
options=(!emptydirs)

_svntrunk=http://abjad.googlecode.com/svn/abjad/trunk/
_svnmod=${_realname}

build() {

  cd ${srcdir}

  if [ -d $_svnmod ] ; then
    (cd $_svnmod && svn update)
    msg "The local files are updated."
  else
    svn co ${_svntrunk} ${_svnmod}
  fi

  cd $srcdir/$_svnmod
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

