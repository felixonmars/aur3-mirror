# Maintainer: doorknob60 <doorknob60 at gmail dot com>

pkgname=eof
pkgver=1.71
pkgrel=2
pkgdesc="A song editor for Frets on Fire"
arch=('i686' 'x86_64')
url="http://www.t3-i.com/pages/project.php?id=eof"
license=('BSD')
groups=('games')
depends=('allegro4' 'libvorbis' 'alsa-oss')
optdepends=('lame: MP3 Support'
'vorbis-tools: also required for MP3 support')
source=("http://www.t3-i.com/apps/eof/downloads/eof-$pkgver-linux.tar.gz" 'eof.desktop')
md5sums=('d2350362c6a4e607f3e5d5f4bbb9a6e5' '8ed6a3cabcf2d8d6ae6204ee3a7fb032')

build() {
cd eof-$pkgver
make
install -d $pkgdir/usr/bin
install -d $pkgdir/usr/share
install -d $pkgdir/usr/share/applications
install -d $pkgdir/usr/share/pixmaps
install -d $pkgdir/usr/share/licenses/$pkgname
mv license.txt $pkgdir/usr/share/licenses/$pkgname
mv ./bin $pkgdir/usr/share/eof
cp $srcdir/eof.desktop $pkgdir/usr/share/applications/
cp $pkgdir/usr/share/eof/eof.ico $pkgdir/usr/share/pixmaps/
cd $pkgdir/usr/bin
echo '#!/bin/sh' > eof
echo 'cd /usr/share/eof/' >> eof
echo 'aoss ./eof' >> eof
chmod +x ./eof
# Weird bugs if I don't do this
chmod -R 777 $pkgdir/usr/share/eof
}
