# Contributor: Alister.Hood <gmail>

pkgname=bibledit-gtk
pkgver=4.8
pkgrel=1
pkgdesc="Tool for Bible editing and translation - desktop version."
arch=('x86_64' 'i686')
url="https://sites.google.com/site/bibledit/"
license=('GPL')
depends=('gtksourceview2' 'webkitgtk2')
makedepends=('rcs')
source=("http://ftp.twaren.net/Unix/NonGNU/bibledit/source/gtk/$pkgname-$pkgver.tar.gz")
sha1sums=('d9d24bd2d7054466d68225885ee42a1afab9794c')
md5sums=('e509449e52142757c2c75af124847941')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
