# Contributor: Philanecros Heliostein <philanecros@gmail.com>

pkgname="python2-mmseg"
pkgver="1.2.4"
pkgrel=1
pkgdesc="Chinese Segment On MMSeg Algorithm"

arch=('i686' 'x86_64')

url="http://pypi.python.org/pypi/mmseg/"
license=('MIT')

#groups=()

depends=('python2>=2.6')
#makedepends=()
#optdepends=()

#provides=()
#conflicts=()
#replaces=()

#backup=()
#options=()

#install=
#changelog=

source=('http://pypi.python.org/packages/source/m/mmseg/mmseg-1.2.4.tar.gz')
#noextract=()
md5sums=('a0531287013bb08f258f9e2023c212b1')

build() {
  cd "${srcdir}/mmseg-${pkgver}"

  # replace /usr/bin/env python with python2
  find . -name '*.py' -exec sed -i -e '1 s/python\s*$/python2/' {} \;

  python2 ./setup.py build || return 1
}

package() {
  cd "${srcdir}/mmseg-${pkgver}"

  python2 ./setup.py install --root=${pkgdir} --prefix=/usr || return 1
}
