# Maintainer: Samuel St-Jean <qekchose __please-remove-this-part__ @ dot gmail.com>

pkgname=python2-dipy-git
pkgver=20130617
pkgrel=1
pkgdesc="Python toolbox for analysis of diffusion MRI (python2 version)"
arch=('any')
license=('BSD')
url="http://dipy.org/"

provides=("python2-dipy=${pkgver}")
conflicts=('python2-dipy')
replaces=('python2-dipy')

makedepends=('git' 'python2' 'cython2'  'python2-numpy' 'python2-nibabel' 'python2-scipy')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-nibabel' 'cython2')
optdepends=('python2-matplotlib: For visualisation'
            'ipython2: Enhanced python shell'
            'python2-pytables: Support for large datasets'
            'vtk: For vtk files support')

_gitroot="https://github.com/nipy/dipy.git"
_gitname=dipy

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

  export LDFLAGS="$LDFLAGS -shared"

  echo "Building dipy python2 version"
  rm -rf "$srcdir/$_gitname-py2-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-py2-build"
  cd "$srcdir/$_gitname-py2-build"
}

package() {

  cd "${srcdir}/$_gitname-py2-build"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-dipy-git"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python2-dipy-git/"

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
             $(find ${pkgdir} -name '*.py')
}
