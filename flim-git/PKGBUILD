# Maintainer: A Frederick Christensen <fauxmight .at. nosocomia .dot. com>

pkgname=flim-git
pkgver=1.14.20121204
pkgrel=1
pkgdesc="A library to provide basic features about message representation or encoding."
arch=('any')
url="https://github.com/wanderlust/flim"
license=('GPL')
depends=('emacs' 'emacs-apel>=10.7')
provides=("flim=$pkgver")
conflicts=('flim')
source=("$pkgname-$pkgver.zip::https://github.com/wanderlust/flim/archive/flim-1_14-wl.zip")
noextract=()
md5sums=('91edf4e09054a200c4c8e726e3f72a0a')

build() {
  cd $srcdir/flim-flim-*
  make
}

package() {
  cd $srcdir/flim-flim-*
  make install PREFIX=$pkgdir/usr
}
