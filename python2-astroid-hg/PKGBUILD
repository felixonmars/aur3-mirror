# Maintainer: Jonathan Kotta <jpkotta at gmail dot com>

pkgname=python2-astroid-hg
pkgver=20130916
pkgrel=1
pkgdesc="Provides an AST representation for Python code."
arch=('any')
url="http://www.pylint.org/astroid"
license=('LGPL')
makedepends=('python2' 'mercurial')
source=()
md5sums=()

depends=('python2' 'python2-logilab-common')
replaces=('python2-logilab-astng')
provides=('python2-astroid')
conflicts=('python2-logilab-astng' 'python2-astroid')

build() {

  cd "${srcdir}"
  if [ -d astroid ] ; then
    (cd astroid ; hg pull -u || return 1)
  else
    hg clone "https://bitbucket.org/logilab/astroid" astroid || return 1
  fi
  
  cd astroid
  python2 setup.py build
}

package() {
  cd "${srcdir}"/astroid

  python2 setup.py install --optimize=1 --skip-build --prefix=/usr --root="${pkgdir}"

  # fix permissions ...
  find "${pkgdir}" -type f -exec chmod +r {} \;
}
