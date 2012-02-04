pkgname=qvideoconverter
pkgver=0.3.1
pkgrel=1
pkgdesc="QVideoConverter is an GUI for mencoder and provides an simple way to convert files/dvds to DivX videos."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.qt-apps.org/content/show.php/QVideoConverter?content=84040"
groups=('qvideoconverter')
depends=('qt')
md5sums=('992cb8141520c89b05432c8a0756b3b9')

source=(http://www.qt-apps.org/CONTENT/content-files/84040-QVideoConverter-${pkgver}-src.tar.bz2)
build() {
cd "$srcdir/"
qmake || return 1
make || return 1
make install || return 1
echo $srcdir
mkdir -p $srcdir/../pkg/usr/bin
mkdir -p $srcdir/../pkg/usr/share/applications
mkdir -p $srcdir/../pkg/usr/share/icons/gnome/24x24/apps
cp $srcdir/bin/qvideoconverter $srcdir/../pkg/usr/bin/qvideoconverter
cp $srcdir/src/icons/logo.png $srcdir/../pkg/usr/share/icons/gnome/24x24/apps/qvideoconverter.png
cp $srcdir/../qvideoconverter.desktop $srcdir/../pkg/usr/share/applications
}

