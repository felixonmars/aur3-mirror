# Maintainer: Stephen Zhang <zsrkmyn at gmail dot com>
pkgname=pointdownload
pkgver=1.2.0
pkgrel=3
pkgdesc="A downloader supporting http, ftp, bt, magnet and thunder protocol"
arch=('x86_64' 'i686')
url="https://github.com/PointTeam/PointDownload"
license=('GPL3')
depends=('gcc-libs' 'qt5-base' 'qt5-webkit' 'qt5-declarative' 'qt5-multimedia' 'qt5-graphicaleffects')
optdepends=()
install=pointdownload.install
if [[ $CARCH == 'x86_64' ]]; then
	source=("$pkgname-$pkgver-$CARCH.deb::http://linuxdeepin.com/forum/download?id=8987")
	md5sums=('eace9c25e646e4ca4d53f75310e17d13')
else
	source=("$pkgname-$pkgver-$CARCH.deb::http://linuxdeepin.com/forum/download?id=8988")
	md5sums=('4e7901f982895ac2eaf765b3f4303731')
fi

package() {
	cd $srcdir
	
	install -d $pkgdir/usr/bin
	install -d $pkgdir/opt

	bsdtar -xf data.tar.xz
	cp -dpr --no-preserve=ownership usr/* $pkgdir/usr/
	cp -dpr --no-preserve=ownership opt/* $pkgdir/opt/

	cat > $pkgdir/usr/bin/pointdownload <<"EOF"
#!/bin/sh
/opt/Point/PointDownload/PointDownload $@
EOF

	chmod +x $pkgdir/usr/bin/pointdownload
}
