# Contributor: Aguilera Dario <dario_21_06@hotmail.com>
pkgname=notify-osd-normal-position
_realname=notify-osd
pkgver=0.9.29
pkgrel=4
pkgdesc="Canonical's on-screen notification display agent, hacked for being displayed with it's normal position and with a custom color"
url="https://launchpad.net/notify-osd"
license="GPL"
arch=('i686' 'x86_64')
depends=('gconf' 'cairo' 'freetype2' 'libwnck')
makedepends=('pkgconfig' 'libnotify')
conflicts=('notification-daemon' 'notify-osd')
provides=('notification-daemon' 'notify-osd')
source=(http://launchpad.net/notify-osd/lucid/ubuntu-10.04-beta-2/+download/notify-osd-0.9.29.tar.gz dynamic.patch notify-color-hack-karmic.patch)
md5sums=('13df20eb3c6d06c17eef07400e1650d8' '1ec30363b9611e7cfedee4cc0a47fb45' 'c34ce8786c2330a4e2adb580fa250230')
build() {
 patch -p0 -i dynamic.patch || return 1
 patch -p0 -i notify-color-hack-karmic.patch || return 1
  cd "$srcdir/$_realname-$pkgver"
  ./configure --prefix=/usr --libexecdir=/usr/lib/notify-osd --disable-gtktest || return 1
  make || return 1
  make install DESTDIR="$pkgdir"
}
