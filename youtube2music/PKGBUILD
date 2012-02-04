# Contributor: Novembri Ivan <ivanDOTnovembriATgmailDOTcom>

pkgname=youtube2music
pkgver=0.6
pkgrel=2
pkgdesc="A video downloader tool"
url="http://youtube2music.sourceforge.net"
arch=('any')
license=('GPL')
depends=('pygtk' 'aria2' 'ffmpeg')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-source.tar.gz" youtube2music_icon.png youtube2music.desktop)
md5sums=('07407cb1a16150cb2ea3195301eba521' 'ac4cebf0d042551b3e45129e25656cf6' '699f065234380331996d93dd28c2c3c6')

build() {
	install -Dm755 $srcdir/youtube2music "$pkgdir/usr/bin/youtube2music"
	install -Dm644 youtube2music.desktop "$pkgdir/usr/share/applications/youtube2music.desktop"
	install -Dm644 youtube2music_icon.png "$pkgdir/usr/share/pixmaps/youtube2music_icon.png"
	install -Dm644 $srcdir/gui.glade "$pkgdir/usr/share/youtube2music/gui.glade"
	install -Dm755 $srcdir/y2m.py "$pkgdir/usr/share/youtube2music/y2m.py"
	install -Dm755 $srcdir/y2m-functions "$pkgdir/usr/share/youtube2music/y2m-functions"
	install -Dm755 $srcdir/y2m_include "$pkgdir/usr/share/youtube2music/y2m_include"	
}
