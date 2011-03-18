# Contributor: tocer <tocer.deng@gmail.com>

pkgname=gprof2dot-hg
pkgver=95
pkgrel=1
pkgdesc="A Python script to convert the output from many profilers into a dot graph."
url="http://code.google.com/p/jrfonseca/wiki/Gprof2Dot"
license=("LGPL")
arch=("any")
depends=(python2)
makedepends=("mercurial")
_hgroot="https://gprof2dot.jrfonseca.googlecode.com/hg/"
_hgrepo="gprof2dot"
md5sums=()

build() {
  cd ${srcdir}
  
  if [ -d ${_hgrepo} ]; then
    cd ${_hgrepo}
    hg pull -u
  else
    hg clone ${_hgroot}/${_hgrepo}
    cd ${_hgrepo}
  fi
  
  msg "Starting build process."
  sed -i '1s/python$/python2/' gprof2dot.py
  install -D -m 755 gprof2dot.py $pkgdir/usr/bin/gprof2dot
}
