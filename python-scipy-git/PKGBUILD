# Maintainer: Daan <d.r.vanrossum_at_gmx dot de>
pkgbase=python-scipy-git
pkgname=('python-scipy-git')
true && pkgname=('python2-scipy-git' 'python-scipy-git')
pkgver=20121120
pkgrel=3
pkgdesc="SciPy is open-source software for mathematics, science, and engineering."
arch=('i686' 'x86_64')
license=('BSD')
url="http://numpy.scipy.org/"
source=('interpolate.py.patch')
md5sums=('0697786464a2099ac315757179a08938')
makedepends=('gcc-fortran' 'python-numpy' 'python2-numpy')
checkdepends=('python-nose' 'python2-nose')

#_gitroot=https://github.com/scipy/scipy.git
_gitroot=git://github.com/scipy/scipy.git
_gitname=scipy

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  unset LDFLAGS
  unset FFLAGS

  echo "Building Python2"
  rm -rf "$srcdir/$_gitname-py2-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-py2-build"
  cd "$srcdir/$_gitname-py2-build"

  # Changing the arithmetic parameter (Thanks to Fabrizio Castellano)
  sed -i "s/\#define\ UNK\ 1/\#define\ IBMPC\ 1/" \
    scipy/special/cephes/mconf.h
  for file in $(find . -name '*.py' -print); do
       sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
       sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  python2 setup.py config_fc --fcompiler=gnu95 build

  echo "Building Python3"
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  # Changing the arithmetic parameter (Thanks to Fabrizio Castellano)
  sed -i "s/\#define\ UNK\ 1/\#define\ IBMPC\ 1/" \
    scipy/special/cephes/mconf.h
  python setup.py config_fc --fcompiler=gnu95 build
}

package_python2-scipy-git() {
  depends=('python2-numpy')
  conflicts=('python2-scipy')
  replaces=('python2-scipy')

  cd "${srcdir}/$_gitname-py2-build"
  patch scipy/interpolate/interpolate.py < ${startdir}/interpolate.py.patch
  python2 setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/python2-scipy/LICENSE"
}

package_python-scipy-git() {
  depends=('python-numpy')
  provides=('python3-scipy' 'scipy')
  conflicts=('python3-scipy' 'python-scipy')
  replaces=('python3-scipy' 'python-scipy')

  cd "${srcdir}/$_gitname-build"
  patch scipy/interpolate/interpolate.py < ${startdir}/interpolate.py.patch
  python setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/python-scipy/LICENSE"
}
