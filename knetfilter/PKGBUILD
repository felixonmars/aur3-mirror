# Contributor: arch0r <arch0r@inbox.com>

pkgname=knetfilter
pkgver=3.5.1
pkgrel=1
pkgdesc="KDE frontend to iptables"
arch=(i686)
url="http://www.kde-apps.org/content/show.php/knetfilter?content=10971"
license=('GPL')
depends=('iptables' 'kdelibs>=3.x' 'qt>=3.x')
source=(http://freshmeat.net/redir/knetfilter/28528/url_tgz/$pkgname-$pkgver.tar.gz)
md5sums=(af985cce72467a199fa75606553986b8)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

