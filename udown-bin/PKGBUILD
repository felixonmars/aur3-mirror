pkgname=udown-bin
pkgver=0.9.11.2436
pkgrel=2
pkgdesc="Official web disk client for 115 Web Disk"
arch=('i686')
url="http://bbs.ylmf.net/forum.php?mod=viewthread&tid=1855287"
license=('custom')
depends=('gtk2' 'wxgtk' 'openssl')
source=('http://bbs.ylmf.net/forum.php?mod=attachment&aid=MjIyMzAwOXw3NDE0OGQzMnwxMzA3MTExMjQ5fDA%3D')
md5sums=('83e3691239ae6add69a1c1254b56e7d2')
         
build(){
cd $srcdir

mkdir -p $pkgdir/usr/lib/YlmfUDown/res

mkdir -p $pkgdir/usr/bin
install UDown $pkgdir/usr/bin/UDown
chmod a+x $pkgdir/usr/bin/UDown

install res/115.gif $pkgdir/usr/lib/YlmfUDown/res/115.gif
install res/logo.ico $pkgdir/usr/lib/YlmfUDown/res/logo.ico
install res/udown_Complete.wav $pkgdir/usr/lib/YlmfUDown/res/udown_Complete.wav

mkdir -p $pkgdir/usr/share/pixmaps
install res/115udown_logo-48.png $pkgdir/usr/share/pixmaps/115udown_logo-48.png

mkdir -p $pkgdir/usr/share/applications
install 115udown.desktop $pkgdir/usr/share/applications/115udown.desktop

mkdir -p $pkgdir/usr/share/applnk/Internet
install 115udown.desktop $pkgdir/usr/share/applnk/Internet/115udown.desktop
}
