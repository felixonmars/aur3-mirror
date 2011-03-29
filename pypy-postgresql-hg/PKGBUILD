# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=pypy-postgresql-hg
pkgver=43072
pkgrel=1
pkgdesc="The PyPy Python JIT, with a built-in PostgreSQL adapter"
url="https://bitbucket.org/alex_gaynor/pypy-postgresql"
arch=('i686' 'x86_64')
depends=('python2' 'libffi')
optdepends=('openssl: openssl module'
            'expat: pyexpat module'
            'ncurses: ncurses module'
            'zlib: zlib module'
            'bzip2: bz2 module'
            'pypy: faster build with PyPy itself')
makedepends=('mercurial' 'subversion')
conflicts=('pypy')
provides=('pypy')
license=('MIT')
#install=('')
source=()
md5sums=()

_hgroot="https://bitbucket.org/alex_gaynor"
_hgrepo="pypy-postgresql"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u -r default
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  # Copy whole repo: pypy wants to include the hg revision in its version
  #hg -R "$srcdir/$_hgrepo" archive -r default "$srcdir/$_hgrepo-build"
  cp -R $srcdir/$_hgrepo $srcdir/$_hgrepo-build
  cd "$srcdir/$_hgrepo-build"

  #cf="`pkg-config --cflags libffi`" || return 1
  #sed "s|cflags = \[|cflags = \[\'${cf/  /}\', |g" -i pypy/translator/platform/linux.py || return 1

  cd pypy/translator/goal
  if which pypy >/dev/null 2>/dev/null; then
    msg "Using PyPy for translation"
    pypy translate.py -Ojit targetpypystandalone.py --withmod-postgresql
  else
    msg "Using CPython for translation"
    python2 translate.py -Ojit targetpypystandalone.py --withmod-postgresql
  fi

  install -Dm755 pypy-c $pkgdir/opt/pypy/pypy-c
  mkdir -p $pkgdir/opt/pypy/{lib-python,pypy}
  cp -r $srcdir/$_hgrepo-build/lib-python/2.5.2 $pkgdir/opt/pypy/lib-python/
  cp -r $srcdir/$_hgrepo-build/lib-python/modified-2.5.2 $pkgdir/opt/pypy/lib-python/
  cp -r $srcdir/$_hgrepo-build/lib_pypy $pkgdir/opt/pypy/
  mkdir -p $pkgdir/usr/bin/
  ln -s /opt/pypy/pypy-c $pkgdir/usr/bin/pypy
}
# vim: ts=2 sw=2 et:
