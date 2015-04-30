# Maintener: Sébastien Martinez (Garrik) garrik@garrik.info
# Based on the PKGBUILD for pypy-hg by Sven-Hendrik Haase (svenstaro) <sh@lutzhaase.com>


pkgname=pypy-dsu
pkgver=2.4.0
pkgrel=2
pkgdesc="The pypy interpreter with DSU enhancements"
url="http://bitbucket.org/smartinezgd/pymoult/wiki/pypy-dsu"
arch=('i686' 'x86_64')
depends=('libffi')
provides=('python2' 'pypy')
options=(!buildflags)
makedepends=('python2')
optdepends=('openssl: openssl module'
            'expat: pyexpat module'
            'ncurses: ncurses module'
            'zlib: zlib module'
            'bzip2: bz2 module')
license=('custom:MIT')

source=('http://bitbucket.org/smartinezgd/pymoult/downloads/pypy-dsu-2.4-2-src.tar.gz')
md5sums=('de9fa4c914d58c2f4129078244fce59d')

build(){
  cd "${srcdir}/pypy-dsu-dc90ef7f2d56/pypy/goal"
  export CFLFAGS="-O1"
  export CXXFLAGS="-O1"

  python2 ../../rpython/bin/rpython -Ojit targetpypystandalone
  cd "${srcdir}/pypy-dsu-dc90ef7f2d56/pypy/tool/release"
  python2 package.py --archive-name pypy-dsu --targetdir "${srcdir}/" 

}

package() {
  cd "${srcdir}"
  tar -xvf pypy-dsu.tar.bz2

  cd "${srcdir}/pypy-dsu/bin"
  install -Dm755 pypy "${pkgdir}/opt/pypy-dsu/pypy"
  install -Dm755 libpypy-c.so "${pkgdir}/opt/pypy-dsu/libpypy-c.so"
  mkdir -p "${pkgdir}/opt/pypy-dsu/lib-python"

  cd "${srcdir}/pypy-dsu"
  cp -r lib-python/2.7 "${pkgdir}/opt/pypy-dsu/lib-python/"
  cp -r lib_pypy "${pkgdir}/opt/pypy-dsu/"
  cp -r include "${pkgdir}/opt/pypy-dsu/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/pypy-dsu/pypy "${pkgdir}/usr/bin/pypy-dsu"


  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/pypy-dsu/LICENSE"
}
# vim: ts=2 sw=2 et:
