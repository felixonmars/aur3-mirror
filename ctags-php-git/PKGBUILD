# Maintainer: Joris Steyn <jorissteyn@gmail.com>

pkgname=ctags-php-git
pkgver=5.8.809.c4256ba
pkgrel=1
pkgdesc="Exuberant ctags fork actively maintained by Geany developer (PHP5.5 support)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('ctags')
conflicts=('ctags')
url="https://github.com/b4n/ctags"
source=("git://github.com/b4n/ctags.git#branch=better-php-parser")
_gitbranch=better-php-parser
md5sums=('SKIP')

pkgver() {
  cd "${SRCDEST}/ctags"
  echo 5.8.$(git rev-list --count $_gitbranch).$(git rev-parse --short $_gitbranch)
}

build() {
  cd "${srcdir}/ctags"

  autoconf
  autoheader

  ./configure --prefix=/usr \
              --disable-external-sort
  make
}

package() {
  cd "${srcdir}/ctags"

  make prefix="${pkgdir}/usr" install
}
