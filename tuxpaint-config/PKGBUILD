# Contributor: royrocks <royrocks13@gmail.com>
pkgname=tuxpaint-config
pkgver=0.0.12
pkgrel=1
pkgdesc="Tux Paint configuration tool."
arch=(i686 x86_64)
url="http://www.tuxpaint.org"
license="GPL"
depends=('tuxpaint' 'fltk' 'libxft' 'libxext')
source=(http://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver.tar.gz)
md5sums=('11ac7654d9670f45c76668317ab6f717')

build() {
 cd $startdir/src/$pkgname-$pkgver
 install -d -m755 $startdir/pkg/usr/bin/
 install -d -m644 $startdir/pkg/opt/kde/share/icons/hicolor/48x48/apps/
 install -d -m644 $startdir/pkg/opt/kde/share/icons/hicolor/32x32/apps/
 install -d -m644 $startdir/pkg/opt/kde/share/icons/hicolor/16x16/apps/
 make PREFIX=/usr || return 1
 make PREFIX=$startdir/pkg/usr DESTDIR=$startdir/pkg KDE_PREFIX=$startdir/pkg/opt/kde KDE_ICON_PREFIX=$startdir/pkg/opt/kde/share/icons  install
 install -D -m644 src/tuxpaint-config.desktop $startdir/pkg/usr/share/applications/tuxpaint-config.desktop
}
