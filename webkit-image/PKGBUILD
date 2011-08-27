pkgname=webkit-image
pkgver=2010.02.17
pkgrel=2
pkgdesc="Webkit Image downloader for the WMS plugin of JOSM"
svn_rev=24624
arch=('i686' 'x86_64')
url="http://svn.openstreetmap.org/applications/editors/josm/plugins/wmsplugin/?p=24624"
license=("GPL")
depends=('qt' 'libwebkit')
makedepends=('automoc4')
source=(http://svn.openstreetmap.org/applications/editors/josm/plugins/wmsplugin/webkit-image.cpp?p=$svn_rev)
md5sums=('b22ed87ff9b07b06b29032fc4bbf0493')
options=('!libtool' '!emptydirs')

build() {
 cd $startdir/src/
 mv webkit-image.cpp\?p=$svn_rev webkit-image.cpp
 mkdir -p $startdir/pkg/usr/bin
 moc webkit-image.cpp > webkit-image.h
 g++ -I /usr/include/qt4/ \
	-I /usr/include/qt4/QtGui \
	-I /usr/include/qt4/QtNetwork \
	-lQtCore -lQtWebKit -lQtGui -s -O2 \
	webkit-image.cpp -o webkit-image
 cp webkit-image $startdir/pkg/usr/bin/
}

