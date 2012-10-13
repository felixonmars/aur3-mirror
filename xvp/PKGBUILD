# Maintainer: Si Feng <si.feng at me.com>
# Contributor: Sergej Pupykin <arch at sergej.pp.ru>

pkgname=xvp
pkgver=1.14.0
pkgrel=1
pkgdesc="Cross-platform VNC-based and Web-based Management for Citrix XenServer and Xen Cloud Platform"
arch=(i686 x86_64)
url="http://www.xvpsource.org"
license=('GPL')
depends=(libxml2 curl libxenserver php php-curl php-mcrypt)
makedepends=(java-environment)
source=(http://www.xvpsource.org/xvp-$pkgver.tar.gz)
md5sums=('c09fa7f11206deb58553558537025ae6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

  mkdir -p $pkgdir/srv/http/
  cp -r web $pkgdir/srv/http/xvpweb || return 1
}
