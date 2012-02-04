# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Mark "markatto" Merritt  <markatto@gmail.com>

pkgname=thelastripper
pkgver=1.4.1
pkgrel=1
pkgdesc="An audio stream ripper for Last.fm"
arch=('i686' 'x86_64')
url="http://thelastripper.com/"
license=('GPL')
depends=('mp3gain' 'gtk-sharp-2>=2.12.0' 'taglib-sharp')
makedepends=('pkgconfig>=0.9.0')
source=(http://$pkgname.googlecode.com/svn/branches/LinuxGeneric/$pkgname-$pkgver.tar.gz)
md5sums=('d291ee4f59fa27f706c6f6d301e5c056')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
