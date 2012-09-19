# Contributor: Leontius Adhika Pradhana <leon@leapon.net>
# Maintainer: Ner0

pkgname=zeitgeist-datahub
pkgver=0.9.5
pkgrel=1
pkgdesc="The datahub provides passive plugins which insert events into Zeitgeist"
url="https://launchpad.net/zeitgeist-datahub"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('dbus-glib' 'gtk2' 'json-glib' 'libzeitgeist' 'telepathy-glib')
makedepends=('intltool' 'pkg-config' 'vala')
source=("http://launchpad.net/zeitgeist-datahub/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz"{,.asc})
md5sums=('b2b76b82b67363c45e5fe4f39a172775'
         'a6379127f85dd20a0cbc0647b4b345d2')

build() {
  cd $pkgname-$pkgver
  
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
