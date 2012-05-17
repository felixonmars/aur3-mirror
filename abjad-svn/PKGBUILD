# Maintainer: Bernardo Barros <bernardobarros@gmail.com>

pkgname=abjad-svn
_realname=abjad
pkgver=5607
pkgrel=1
pkgdesc="Abjad: a Python API for Formalized Score Control"
url="http://code.google.com/p/abjad/"
arch=('any')
license=('GPL')
depends=('python2>=2.7' 'lilypond')
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

  python2.7 setup.py install --root="$pkgdir/" --optimize=1

}

