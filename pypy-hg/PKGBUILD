# Original author: Sven-Hendrik Haase (svenstaro) <sh@lutzhaase.com>
# Maintainer: Zack Buhman (buhman) <zack@buhman.org>
# Contributor: William Giokas (KaiSforza) <1007380@gmail.com>

pkgname=pypy-hg
pkgver=73503
pkgrel=1
pkgdesc="A Python implementation written in Python, JIT enabled"
url="http://codespeak.net/pypy/"
arch=('any')
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
provides=('python2' 'pypy')
options=(!buildflags)
makedepends=('tk' 'sqlite' 'mercurial' 'pypy')
conflicts=('pypy')
replaces=('pypy')
optdepends=('sqlite: sqlite module'
            'tk: tk module')
license=('custom:MIT')

# Why use python2 or a previous version of pypy to do the translation when we
# could just as easily use the upstream binary?
source=('hg+https://bitbucket.org/pypy/pypy')
md5sums=('SKIP')

pkgver() {
  cd pypy

  echo "$(hg id -n)"
}

build() {
  cd pypy/pypy/goal

  pypy ../../rpython/bin/rpython -Ojit targetpypystandalone
}

package() {
  cd pypy

  install -Dm755 pypy/goal/pypy-c "${pkgdir}"/opt/pypy/bin/pypy-c
  install -Dm755 pypy/goal/libpypy-c.so "${pkgdir}"/usr/lib/libpypy-c.so
  cp -r include lib_pypy site-packages "${pkgdir}"/opt/pypy/

  mkdir "${pkgdir}"/opt/pypy/lib-python/
  cp -r lib-python/2.7 "${pkgdir}"/opt/pypy/lib-python/

  mkdir -p "${pkgdir}"/usr/bin
  ln -s /opt/pypy/bin/pypy-c "${pkgdir}"/usr/bin/pypy

  install -Dm644 LICENSE "${pkgdir}"/opt/pypy/LICENSE
  install -Dm644 README.rst "${pkgdir}"/opt/pypy/README.rst
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/pypy/LICENSE

  # Compile binary modules
  export LD_LIBRARY_PATH="${pkgdir}"/usr/lib:${LD_LIBRARY_PATH}
  for module in _curses syslog gdbm sqlite3 _tkinter; do
     "${pkgdir}"/opt/pypy/bin/pypy-c -c "import ${module}"
  done
}
# vim: ts=2 sw=2 et:
