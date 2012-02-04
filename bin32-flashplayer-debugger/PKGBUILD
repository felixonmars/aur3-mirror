# Maintainer : cman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=bin32-flashplayer-debugger
pkgver=10.0.45.2
pkgrel=2
pkgdesc="Macromedia standalone flash debugger (nonfree)"
url="http://www.adobe.com/support/flashplayer/downloads.html"
license="custom"
conflicts=('bin32-flashplayer-standalone')
depends=('lib32-curl' 'lib32-gtk2' 'lib32-libxdamage' 'lib32-libxt' 'lib32-pango' 'lib32-nss')
install=(flashplayer.install)
source=(http://download.macromedia.com/pub/flashplayer/updaters/10/flash_player_10_linux_dev.tar.gz \
        flashplayer \
        gflashplayer.png \
        flashplayer.desktop)
arch=('x86_64')

md5sums=('67f5081cf7d122063b332ea3e59d838b'
         '8223f61730045784cc087e60f7fd7e8b'
         'b6b218eacdb3bc2efae9292526a8cd05'
         '42ae23f68eb7b7544ccf36ccf31c21dd')
		 
build() {
  cd $startdir/src/
  install -D -m755 flash_player_10_linux_dev/standalone/debugger/flashplayer.tar.gz $startdir/pkg/opt/lib32/usr/bin/flashplayer.tar.gz || return 1
  install -D -m755 flashplayer $startdir/pkg/usr/bin/flashplayer || return 1
  install -D -m755 gflashplayer.png $startdir/pkg/usr/share/pixmaps/gflashplayer.png || return 1
  install -D -m755 flashplayer.desktop $startdir/pkg/usr/share/applications/flashplayer.desktop || return 1
  install -D -m755 flash_player_10_linux_dev/README $startdir/pkg/usr/share/licenses/${pkgname/bin32-/}/README

}
