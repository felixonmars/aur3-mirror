# Maintainer: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=emacs-magit
pkgver=1.2.1
pkgrel=1
pkgdesc="It's Magit! An Emacs mode for Git."
arch=('any')
url="http://magit.github.io/magit/"
license=('GPL3')
depends=('emacs' 'git')
install=emacs-magit.install
source=("https://github.com/magit/magit/archive/${pkgver}.tar.gz")
md5sums=('2af024a762d113ecde44e0f81aa3c178')

build() {
  cd "$srcdir/magit-$pkgver"
  make
}

package() {
  cd "$srcdir/magit-$pkgver"
  make PREFIX="/usr/" DESTDIR="$pkgdir/" install_all
  rm -fR "$pkgdir/etc"
}
