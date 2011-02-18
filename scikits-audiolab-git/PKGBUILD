# Contributor: Iwan Gabovitch <qubodup@gmail.com>
pkgname=scikits-audiolab-git
pkgver=20110217
pkgrel=3
pkgdesc="python package for reading/writing audio files from numpy arrays"
arch=('i686' 'x86_64')
url="http://scipy.org/scipy/scikits/wiki/AudioLab"
license=('LGPL')
depends=('python2' 'libsndfile' 'python2-numpy' 'scikits-base')
makedepends=('setuptools' 'subversion')
provides=('scikits-audiolab')
conflicts=('scikits-audiolab')
source=()
md5sums=()

_gitroot=git://github.com/cournape/audiolab.git
_gitname='audiolab'

build() {
  cd "$srcdir"

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi

  mkdir -p $pkgdir/usr/lib/python2.7/site-packages

  python2 setup.py install --root=${pkgdir} || return 1

  rm "$pkgdir/`python2 -c 'from distutils.sysconfig import get_python_lib; \
  print get_python_lib()'`/scikits/__init__.py"
}

