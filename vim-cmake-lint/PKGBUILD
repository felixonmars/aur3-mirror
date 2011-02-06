pkgname=vim-cmake-lint
pkgver=1.2
pkgrel=1
pkgdesc="Provides vim autocompletion for CMake files"
arch=('any')
url="http://cmake-lint.googlecode.com"
license=('APACHE')
groups=('vim-plugins')
depends=('vim')
source=(http://cmake-lint.googlecode.com/files/cmake-lint-$pkgver.tar.gz)
md5sums=('c4b7cf8f5c82195dccb028a165139f10')

build() {
  cd "$srcdir/cmake-lint-$pkgver"

  install -dm755 "$pkgdir/usr/share/vim/vimfiles/"
  cp -a vim/autoload vim/plugin "$pkgdir/usr/share/vim/vimfiles/"
}
