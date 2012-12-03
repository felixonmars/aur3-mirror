# Maintainer: A Frederick Christensen <fauxmight .at. nosocomia .dot. com>

pkgname=semi-git
pkgver=1.14.20121203
pkgrel=1
pkgdesc="A library to provide MIME feature for GNU Emacs."
arch=(any)
url="https://github.com/wanderlust/semi"
license=('GPL')
depends=('emacs' 'emacs-apel>=10.7' 'flim>=1.6.0')
provides=("semi=$pkgver")
conflicts=('semi')
source=("$pkgname-$pkgver.zip::https://github.com/wanderlust/semi/archive/semi-1_14-wl.zip")
md5sums=('e61b7443ddf4304859dcacfe0b1fee57')

build() {
  cd $srcdir/semi-semi-*
  make

}

package() {
  cd $srcdir/semi-semi-*
  make install PREFIX=$pkgdir/usr
}
