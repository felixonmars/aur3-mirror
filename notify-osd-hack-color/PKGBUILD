# Contributor: Aguilera Dario <dario_21_06@hotmail.com>
pkgname=notify-osd-hack-color
_realname=notify-osd
pkgver=0.9.34
pkgrel=1
pkgdesc="Canonical's on-screen notification display agent, hacked for being displayed with it's normal position and with a custom color"
url="https://launchpad.net/notify-osd"
license="GPL"
arch=('i686' 'x86_64')
depends=('gconf' 'cairo' 'freetype2' 'libwnck')
makedepends=('pkgconfig' 'libnotify')
conflicts=('notification-daemon' 'notify-osd')
provides=('notification-daemon' 'notify-osd')
source=(https://launchpad.net/notify-osd/precise/0.9.34/+download/notify-osd-0.9.34.tar.gz dynamic.patch notify-color-hack-karmic.patch)
md5sums=('18d9a95467daac570789fb7893011595' '54241bc7f140a8363440396f45847371' 'aac2d69898a4e852c86614a76f1c4b9f')
build() {
  patch -p0 -i dynamic.patch || return 1
  patch -p0 -i notify-color-hack-karmic.patch || return 1
# cd "$srcdir/$_realname-$pkgver"
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib/notify-osd --disable-gtktest || return 1
  make || return 1
  make install DESTDIR="$pkgdir"
}
