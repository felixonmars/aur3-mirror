# Maintainer: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Jens <jens@jenux.homelinux.org>

pkgname="notification_plugin"
pkgver=0.31
pkgrel=2
pkgdesc="libnotify plugin for claws-mail"
url="http://www.claws-mail.org/plugin.php?plugin=notification"
license=("GPL3")
arch=('i686' 'x86_64')
depends=("claws-mail>=3.9.0" "libnotify" "libcanberra")
conflicts=("claws-mail-extra-plugins")
source=("http://www.claws-mail.org/downloads/plugins/$pkgname-$pkgver.tar.gz")
options=('!libtool')
md5sums=('f37715f38f5f06b3a9dde607ea5c3ef8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
