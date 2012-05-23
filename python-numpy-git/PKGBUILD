# Maintainer: Daan <d.r.vanrossum_at_gmx dot de>
pkgbase=python-numpy-git
pkgname=('python-numpy-git')
true && pkgname=('python2-numpy-git' 'python-numpy-git')
pkgver=20120523
pkgrel=2
pkgdesc="Scientific tools for Python (dual python2/python3)"
arch=('i686' 'x86_64')
license=('custom')
url="http://numpy.scipy.org/"
makedepends=('git' 'lapack' 'python' 'python2' 'python-distribute' 'python2-distribute' 'gcc-fortran' 'python-nose')

_gitroot=https://github.com/numpy/numpy.git
#_gitroot=git://github.com/numpy/numpy.git
_gitname=numpy

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

  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python2"
  rm -rf "$srcdir/$_gitname-py2-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-py2-build"
  cd "$srcdir/$_gitname-py2-build"
  python2 setup.py config_fc --fcompiler=gnu95 build

  echo "Building Python3"
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  python setup.py config_fc --fcompiler=gnu95 build
}

package_python2-numpy-git() {
  depends=('lapack' 'python2')
  optdepends=('python-nose: testsuite')
  provides=("python2-numpy=${pkgver}")
  conflicts=('python2-numpy')
  replaces=('python2-numpy')

  cd "${srcdir}/$_gitname-py2-build"
  python2 setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-numpy-git"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-numpy-git/"

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
             $(find ${pkgdir} -name '*.py')
}

package_python-numpy-git() {
  depends=('lapack' 'python')
  provides=("python3-numpy=${pkgver}" "python-numpy=${pkgver}")
  conflicts=('python3-numpy' 'python-numpy')
  replaces=('python3-numpy' 'python-numpy')

  cd "${srcdir}/$_gitname-build"
  python setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy-git"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy-git/"
}
