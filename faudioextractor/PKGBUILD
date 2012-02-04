# Maintainer: Denis Falqueto <denisfalqueto@gmail.com>
pkgname=faudioextractor
pkgver=20120116
_kdeappsprefix=147841
_kdeappsname=FAudioExtractor
pkgrel=1
pkgdesc="A simple program which can extract the sound from a moviefile"
arch=('i686', 'x86_64')
url="http://kde-apps.org/content/show.php/FAudioExtractor?content=147841&PHPSESSID=83d28cf05238775dfc925be93d630bc9"
license=('GPL')
depends=('qt')
source=($_kdeappsprefix-$_kdeappsname.tar.gz)

build() {
  cd "$srcdir/$_kdeappsname-$pkgver"
  qmake
  make
}

package() {
  cd "$srcdir/$_kdeappsname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 $_kdeappsname "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
md5sums=('779fd361f30200be0791cc58ec0be068')
