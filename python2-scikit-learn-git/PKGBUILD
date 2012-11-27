# Maintainer: Wei LI <kuantkid at gmail dot com>
# part contents borrowed from Andrzej Giniewicz <gginiu@gmail.com>
pkgname='python2-scikit-learn-git'
pkgrel=1
pkgver=20121126
pkgdesc='scikit-learn is a Python module integrating classic machine learning algorithms in the tightly-knit scientific Python world.'
arch=('i686' 'x86_64')
url='http://scikit-learn.org'
license=('BSD')
provides=('scikit-learn')
conflicts=('scikit-learn')
depends=('python2-scipy')
makedepends=('python2-distribute' 'cython2>=0.15')

_gitroot='https://github.com/scikit-learn/scikit-learn.git'
_gitname='scikit-learn'

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
  install -D "${srcdir}/${_gitname}/COPYING" "$pkgdir"/usr/share/licenses/scikits-learn/LICENSE
}