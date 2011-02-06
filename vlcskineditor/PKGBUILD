# Contributor: Skipio <skipio86 at gmail dot com>

pkgname=vlcskineditor
pkgver=0.8.5
pkgrel=1
pkgdesc="The VLC Skin Editor aims at giving designers an easy opportunity to create skins for the VLC Media Player"
url="http://www.videolan.org/vlc/skineditor.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('java-runtime' 'x-server')
source=(http://mirror.informatik.uni-mannheim.de/pub/mirrors/videolan.org/skin-editor/$pkgver/VLCSkinEditor_unix.tar.gz)
md5sums=('62ea5993ddcd2b926b89fa3ea31b8d53')

build() {
	install -d -m755 $pkgdir/usr/share/java
	cp -R $srcdir $pkgdir/usr/share/java/$pkgname
	}
