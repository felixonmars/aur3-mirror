# Maintainer:<linuxfish.exe at gmail dot com>
# Contributor: <sunshine1985115 at gmail dot com>
pkgname=migumusic-noqtlib
pkgver=2011Beta1
pkgrel=2
pkgdesc="MiguMusic(No QT lib)"
arch=(i686)
url="http://music.10086.cn/newweb/zq/2009/migu_music_client/default/_/_/_/_/_/_/p.html"
license=(custom)
depends=('qt' 'phonon')
source=("http://interface-club.12530.com/update/Linux/MiguMusic_noqtlib_2011Beta1.bin")
md5sums=('f1ac9065504f5eca4d9e57562015a1a3')
_pkgname=MiguMusic
build() {
	cd $srcdir
	sed -e '1,/^exit 0$/d' MiguMusic_noqtlib_$pkgver.bin |
	tar zxO --wildcards *$_pkgname.tar.gz |
	tar zx
	install -dm755 $pkgdir/opt/$_pkgname
	cp -rf Resources MiguMusic Readme $pkgdir/opt/$_pkgname
	install -Dm755 MiguMusic.sh $pkgdir/opt/$_pkgname/
  echo "[Desktop Entry]
	Type=Application
	Version=1.0.1
	Name=MiguMusic
	Comment=Migu Music
	Icon=/opt/$_pkgname/Resource/icon/ICONmacmusic.png
	Exec=/opt/$_pkgname/MiguMusic.sh
	Categories=AudioVideo;Player
	Terminal=false
	Path=/opt/$_pkgname
	StartupNotify=true" > MiguMusic.desktop
        install -Dm755 MiguMusic.desktop $pkgdir/usr/share/applications/MiguMusic.desktop
}
