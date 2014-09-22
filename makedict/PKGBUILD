# Maintainer: Kristian Villalobos <villalobos.kristian@gmail.com>
# Contributor: Semen Turchikhin <tursom@gmail.com>

pkgname=makedict
pkgver=0.3
pkgrel=2
pkgdesc="Many dictionary formats converter"
url="http://xdxf.sourceforge.net/" 
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'python')
makedepends=('cmake' 'git')
source=("git+https://github.com/soshial/xdxf_makedict.git"
        'log.patch')
md5sums=('SKIP'
         '59fa719964fa352bddc0052d382a0761')

build() {
  cd $srcdir
  patch -p1 -i ../log.patch
  msg "Starting make..."
  cd $srcdir/xdxf_makedict
  cmake -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
}

package() {
  cd $srcdir/xdxf_makedict

  msg "Installing..."

  make DESTDIR=$pkgdir install || return 1
}
