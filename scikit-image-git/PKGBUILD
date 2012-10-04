# Maintainer: Wei LI <kuantkid at gmail dot com>
# part contents borrowed from Andrzej Giniewicz <gginiu@gmail.com>
pkgname='scikit-image-git'
pkgrel=1
pkgver=20121003
pkgdesc='scikit-image is a collection of algorithms for image processing in python'
arch=('i686' 'x86_64')
url='http://skimage.org'
license=('BSD')
provides=('scikit-image')
conflicts=('scikit-image' 'scikits-image')
depends=('python2-scipy')
makedepends=('python2-distribute' 'cython2>=0.15')

_gitroot='https://github.com/scikit-image/scikit-image.git'
_gitname='scikit-image'

build() {
  cd "${srcdir}"
  msg 'Connecting to GIT server....'

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg 'The local files are updated.'
    cd ..
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'
  
  cd "${_gitname}"
  unset LDFLAGS

  python2 setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -D "${srcdir}/${_gitname}/LICENSE.txt" "$pkgdir"/usr/share/licenses/scikits-learn/LICENSE
}