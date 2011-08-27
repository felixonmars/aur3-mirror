pkgname=ircp-tray
pkgver=0.7.6
pkgrel=1
pkgdesc="A simple IrDA wireless file transfer application"
arch=('i686' 'x86_64')
url="https://launchpad.net/ircp-tray"
license=('GPLv2+')
depends=('gtk2' 'libnotify' 'openobex' 'irda-utils' 'intltool')
makedepends=('gtk2' 'libnotify' 'openobex')
install=$pkgname.install
source=(http://launchpad.net/ircp-tray/0.7/$pkgver/+download/$pkgname-$pkgver.tar.gz ircptray_main.patch recvfile.patch)
md5sums=('0694ab35c085351dfc71b94e75a905e5' 'a636701d9ce9ff01f614a472ee31e088' 'de068d421c7aeb869ee8c60bd466725d') 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < ../ircptray_main.patch || return 1
  patch -p0 < ../recvfile.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
