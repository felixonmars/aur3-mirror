# Maintainer: Philippe DUCRETTET <ecolinux@gmx.fr>

pkgname=freeplayer
pkgver=20070531
pkgrel=1
pkgdesc="An application to use with french ISP 'Free's triple-play box to enhance it."
arch=(i686 x86_64)
url="http://free.fr/"
license="GPL"
depends=('vlc')
source=(ftp://ftp.free.fr/pub/freeplayer/$pkgname-linux-$pkgver.tgz )

package () {
install -d -m755 $startdir/pkg/usr/bin
install -d -m755 $startdir/pkg/usr/share/freeplayer/doc
install -d -m777 $startdir/pkg/usr/share/freeplayer/http-fbx
cat $startdir/src/freeplayer/bin/vlc-fbx.sh | sed "s/--wx-systray//g" | sed -e "s/%HTTP_PATH%/\/usr\/share\/freeplayer\/http-fbx/g" > $startdir/pkg/usr/bin/xfreeplayer
cat $startdir/pkg/usr/bin/xfreeplayer | sed "s/^exec vlc/exec cvlc/g" > $startdir/pkg/usr/bin/freeplayer
cp $startdir/src/freeplayer/bin/fbx-playlist.pl $startdir/pkg/usr/bin/fbx-playlist.pl
cp -Ra $startdir/src/freeplayer/share/doc $startdir/pkg/usr/share/freeplayer
cp -Ra $startdir/src/freeplayer/share/http-fbx/* $startdir/pkg/usr/share/freeplayer/http-fbx
chmod +x $startdir/pkg/usr/bin/*
}
md5sums=('e766e9397001a43d64a6e0b0518a346a')
