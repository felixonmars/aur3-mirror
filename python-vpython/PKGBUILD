#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
#Contributor: Juergen Hoetzel <juergen@archlinux.org>
#Contributor: Comete <la_comete@tiscali.fr>

pkgname=python-vpython
pkgver=5.74
pkgrel=1
pkgdesc="A Python module that offers real-time 3D output"
arch=('i686' 'x86_64')
url="http://www.vpython.org"
depends=('gtkglextmm' 'libglademm' 'python2' 'python2-numpy' 'boost-libs' 'wxpython' 'tk' 'python2-fonttools' 'python2-polygon' 'python2-ttfquery')
makedepends=('boost>=1.47')
license=('custom')
options=(!libtool)
source=(http://www.vpython.org/contents/download/visual-${pkgver}_release.tar.bz2
        boostmt.patch)
md5sums=('44af0dfbe8b8838eb3768e6bcef4d404'
         'bc61912ad69381db0852c29e7a0ff93f')

build() {
  cd "${srcdir}"/visual-${pkgver}_release

  patch -p1 < "${srcdir}"/boostmt.patch

  pythondir=`python2 -c "from distutils import sysconfig; print sysconfig.get_python_lib()"`
  export PYTHON=/usr/bin/python2
  unset PYTHONPATH # ignore developers PYTHONPATH
  ./configure --prefix=/usr \
              --with-example-dir="$pythondir/visual/demos"
  make
}

package() {
  cd "${srcdir}"/visual-${pkgver}_release
  make DESTDIR="${pkgdir}" install
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

