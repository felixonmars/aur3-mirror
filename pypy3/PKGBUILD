# Maintainer: Mort Yao <mort.yao@gmail.com>

pkgname=pypy3
pkgver=2.1_beta1
pkgrel=1
pkgdesc="A Python implementation written in Python, JIT enabled"
url="http://pypy.org"
arch=('i686' 'x86_64')
depends=('libffi')
provides=('python')
options=(!buildflags)
makedepends=('python2' 'pypy'
             'tcl>=8.6' 'tcl<8.7'
             'tk>=8.6' 'tk<8.7')
optdepends=('openssl: openssl module'
            'expat: pyexpat module'
            'ncurses: ncurses module'
            'zlib: zlib module'
            'bzip2: bz2 module')
license=('custom:MIT')
source=("https://bitbucket.org/pypy/pypy/downloads/$pkgname-${pkgver//_/-}-src.tar.bz2"
        'tklib.patch')
md5sums=('bc2013d1927dc1c0c91228e566abd8da'
         '5aefc12b00d5e493de5885a88b5f3516')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver//_/-}-src

  patch -p1 -i ../tklib.patch
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver//_/-}-src/pypy/goal

  pypy ../../rpython/bin/rpython -Ojit targetpypystandalone
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver//_/-}-src/pypy/tool/release

  python2 package.py ../../../ pypy3 pypy-c "${srcdir}"/${pkgname}.tar.bz2

  mkdir -p "${pkgdir}"/opt
  tar x -C "${pkgdir}"/opt -f "${srcdir}"/${pkgname}.tar.bz2

  mkdir -p "${pkgdir}"/usr/bin
  ln -s /opt/pypy3/bin/pypy-c "${pkgdir}"/usr/bin/pypy3

  install -Dm644 "${pkgdir}"/opt/pypy3/LICENSE "${pkgdir}"/usr/share/licenses/pypy3/LICENSE
}
# vim: ts=2 sw=2 et:
