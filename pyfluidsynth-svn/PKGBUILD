# Maintainer: Bernardo Barros <bernardobarros@gmail.com>

pkgname=pyfluidsynth-svn
pkgver=5
pkgrel=1
pkgdesc="Python bindings for FluidSynth"
arch=('any')
url="http://code.google.com/p/pyfluidsynth"
license=('LGPL')
depends=('fluidsynth' 'python-numpy')
provides=('pyfluidsynth')
conflicts=('pyfluidsynth')
source=()

_svntrunk=http://pyfluidsynth.googlecode.com/svn/trunk/
_svnmod=pyfluidsynth

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  python2 setup.py build
  python2 setup.py install --prefix=$pkgdir/usr
}
