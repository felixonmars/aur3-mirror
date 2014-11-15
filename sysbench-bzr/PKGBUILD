# Maintainer: Michel Blanc <mb@mbnet.fr>
# Contributor: ultraviolet <ultravioletnanokitty@gmail.com>
pkgname=sysbench-bzr
pkgver=5r128
pkgrel=2
_bzrname=sysbench
pkgdesc="Benchmark tool for evaluating OS parameters that are important for a system running a database under intensive load."
url="https://launchpad.net/sysbench"
arch=('i686' 'x86_64')
license="GPL"
source=("$_bzrname::bzr+lp:sysbench")
md5sums=('SKIP')

pkgver() {
  cd $_bzrname
  printf "5r%s" "$(bzr revno)"
}

build() {
  cd "$_bzrname"
  ./autogen.sh || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd $_bzrname
  make DESTDIR=$pkgdir install || return 1
  mkdir -p $pkgdir/usr/share/doc/sysbench/tests/db/
  cp -aRf sysbench/tests/db/*.lua $pkgdir/usr/share/doc/sysbench/tests/db/
}
