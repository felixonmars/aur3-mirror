# Maintainer: kfgz <kfgz at interia pl>

pkgname=cachebench
pkgver=20080523
pkgrel=1
pkgdesc="A program to empirically determine some parameters about an architectures memory subsystem"
arch=('i686' 'x86_64')
url="http://icl.cs.utk.edu/projects/llcbench/cachebench.html"
license=('GPL')
source=(http://icl.cs.utk.edu/projects/llcbench/llcbench.tar.gz)
md5sums=(2334a4b679e4f63c5c646cc8d9ff3f25)

build() {
  cd ${srcdir}/llcbench
  sed -i "s/O3/O2/g" conf/sys.linux-mpich
  make linux-mpich
  make cache-bench
}

package() {
  install -m755 -D ${srcdir}/llcbench/cachebench/cachebench \
                   ${pkgdir}/usr/bin/cachebench
}
