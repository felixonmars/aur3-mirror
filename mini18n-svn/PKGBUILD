# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=mini18n-svn
pkgver=3240
pkgrel=1
pkgdesc="A a small and non-intrusive translation library designed for small memory and non-GNU systems. (GIT version)"
arch=('x86_64' 'i386')
url="http://wiki.yabause.org/index.php5?title=Mini18n"
license=('GPL')
makedepends=('git' 'cmake')
conficts=('mini18n' 'mini18n-git')
provides=('mini18n' 'mini18n-git')

source=("svn://svn.code.sf.net/p/yabause/code/trunk/mini18n")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/mini18n"
  svnversion | tr -d [A-z]
}

build() {
  rm -rf "${srcdir}/mini18n-build"
  mkdir -p "${srcdir}/mini18n-build"
  cd "${srcdir}/mini18n-build"
  
  cmake ../mini18n -DCMAKE_INSTALL_PREFIX=/usr
  make -j8
}

package() {
  cd "${srcdir}/mini18n-build"
  make DESTDIR="${pkgdir}/" install
}

