# Maintainer: Maciej Helminiak <machel@opmbx.org>
pkgname=tfman
pkgver=0.2.0
pkgrel=1
pkgdesc="text file manager, manages files through textual representation of filesystem"
arch=('i686' 'x86_64')
url="https://chiselapp.com/user/machel/repository/tfman/home"
license=('GPL3')
depends=()
makedepends=()
optdepends=('vim: use Tfman as multi-window file manager within Vim')
install='tfman.install'
source=(http://chiselapp.com/user/machel/repository/tfman/doc/tip/.packages/$pkgname-$pkgver-$pkgrel.tar.gz)
md5sums=('a3443be335ef624764249edced0f16bd')
sha256sums=('ae7b7c3ee54fdd1d02b1829e45ff048a0e857574436bff4956cd233d8d41e27f')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  make
}

package() {
  vim_dir="/usr/share/tfman/vim/vimfiles"
  cd "${srcdir}/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" vimdir="$vim_dir"
}
