#Maintainer:Kwrazi<kwrazi@gmail.com>

_pkgname=qmtest
pkgname=python2-${_pkgname}-git
pkgver=20110310
pkgrel=1
pkgdesc="An open-source, general-purpose, cross-platform python2 software testing tool"
arch=('i686' 'x86_64')
url="http://www.python.org/workshops/2002-02/papers/01/"
license=('GPL2')
depends=('python2')
makedepends=('git')
provides=('${_pkgname}')
conflicts=(${_pkgname},"${_pkgname}-svn")
source=('git+https://github.com/MentorEmbedded/qmtest.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
  cd ${srcdir}/${_pkgname}

  # compile the source
  python2 setup.py build

  # Fix python to python2 in qmtest script
  if ! grep python2 scripts/qmtest >& /dev/null; then
    echo "Fixing qmtest..."
    mv scripts/qmtest scripts/qmtest.orig
    cp `find build -name qmtest` scripts/qmtest
  fi
  # Provide qm package to qmtest script
  QMPATH=`find build -name qm | grep lib`
  # Make documentation
  PYTHONPATH=`dirname ${QMPATH}` python2 setup.py build_doc
}

package() {
  cd ${srcdir}/${_pkgname}

  python2 setup.py install --root="$pkgdir/" --optimize=1
}
