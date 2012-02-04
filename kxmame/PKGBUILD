# Contributor: Shahar Weiss <sweiss4@gmx.net>

pkgname=kxmame
arch=(i686 x86_64)
pkgver=1.2
pkgrel=2
pkgdesc="KDE port of GXmame frontend for xmame emulator."
url="http://sourceforge.net/projects/kxmame"
license="GPL"
depends=('kdelibs')
source=(http://heanet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2
	kxmame.desktop)

md5sums=('2a93f490519e945b77a42924fa37fc3f'
	 '5ef60eec842429c14507cac2a65530d4')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --disable-joystick
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -m644 -D $startdir/src/kxmame.desktop \
    $startdir/pkg/usr/share/applications/kxmame.desktop
}
