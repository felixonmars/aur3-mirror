# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Scott Garrett <mail@exovenom.net>

pkgname=gnome-shell-extension-searchbookmarks
pkgver=9
pkgrel=1
pkgdesc="GNOME Shell extension to search in bookmarks of different webbrowsers from the overview."
arch=('any')
url="https://github.com/bmh1980/gnome-shell-extension-searchbookmarks"
license=('GPL')
depends=('gnome-shell')
source=("https://github.com/bmh1980/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('5dd468da08b76517a9b501ab286dac444a90458965c521b0b7226a59d108b425')

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
