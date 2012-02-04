# Contributor: mrgreen.linuxuser@gmail.com
# pkgbuild written by the Snowman ;-)

pkgname=pythophotopod
pkgver=0.3.0
pkgrel=1
pkgdesc="a GUI for Linux synchronizing photos and photo albums with your iPod with a color display"
url="http://pythophotopod.sourceforge.net/"
depends=('python' 'pygtk' 'gtk2')
source=(http://dl.sourceforge.net/sourceforge/pythophotopod/pythoPhotoPod-$pkgver.tar.gz)
md5sums=('a3a833b8b041c67e9f612c3092b6eadf')

build() {
cd $startdir/src/pythoPhotoPod-$pkgver
make include_dirs=-I/usr/include/python2.4 || return 1
install -D -m755 src/pythoPhotoPod.py $startdir/pkg/usr/bin/pythoPhotoPod.py
install -d $startdir/pkg/usr/lib/python2.4/site-packages/libPythoPhotoPod/
install -D -m755 src/photoPodThumbC.so $startdir/pkg/usr/lib/python2.4/site-packages/libPythoPhotoPod/photoPodThumbC.so
install -m644 src/*.pyc $startdir/pkg/usr/lib/python2.4/site-packages/libPythoPhotoPod
install -d $startdir/pkg/usr/share
cp -r src/pixmaps $startdir/pkg/usr/share/
}
