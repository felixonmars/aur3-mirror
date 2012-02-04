# Contributor: rabyte <rabyte__gmail>
# Contributor: SaintShakaJin <saintshakajin.3@laposte.net>

pkgname=zsnes-wip
pkgver=1112
pkgrel=3
pkgdesc="A Super Nintendo emulator (WIP version)"
arch=('i686')
url="http://zsnes.ipherswipsite.com/"
license=('GPL')
depends=('sdl>=1.2' 'libpng>=1.2' 'libgl')
makedepends=('autoconf' 'automake' 'nasm')
conflicts=('zsnes')
provides=('zsnes')
source=(http://files.ipherswipsite.com/zsnes/ZSNESS_$pkgver.tar.bz2 \
	zsnes.png \
	zsnes.desktop)
md5sums=('d820754135a46a014d7014d8b517f367' 'dba2f020ed143a88628145ad79eabcaf'
	 'f0b072c4057fb1de397bcabebe0714ed')

build() {
  cd $startdir/src
  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -m644 -D zsnes.png $startdir/pkg/usr/share/pixmaps/zsnes.png
  install -m644 -D zsnes.desktop $startdir/pkg/usr/share/applications/zsnes.desktop
}
