# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=pypy-nightly
pkgver=1.8
pkgrel=1
pkgdesc="Python interpreter and JIT written in Python (nightly development build)"
url="http://pypy.org/"
arch=('i686' 'x86_64')
depends=('python2' 'libffi' 'openssl098' 'ncurses' 'expat' 'zlib' 'bzip2')
conflicts=('pypy')
provides=("pypy=$pkgver")
license=('MIT')

build() {
  if [ "${CARCH}" = "i686" ]; then
    tarball="pypy-c-jit-latest-linux.tar.bz2"
  else
    tarball="pypy-c-jit-latest-linux64.tar.bz2"
  fi

  cd "$srcdir"
  rm -rf pypy-c-jit-*-*-*/
  wget --timestamping "http://buildbot.pypy.org/nightly/trunk/$tarball"
  tar xjf "$tarball"

  name=pypy-c-jit-*-*-*/

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cp $srcdir/$name/LICENSE $pkgdir/usr/share/licenses/$pkgname

  mkdir -p $pkgdir/opt/
  mv $srcdir/$name $pkgdir/opt/pypy

  mkdir -p $pkgdir/usr/bin/
  ln -s /opt/pypy/bin/pypy $pkgdir/usr/bin/pypy
}

# vim: ts=2 sw=2 et:
