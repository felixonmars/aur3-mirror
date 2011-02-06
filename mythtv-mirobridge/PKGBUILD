# Contributor: h4v <h4v-cypherfloorPKG@h4v.eu>
pkgname=mythtv-mirobridge
pkgver=0.4.2
pkgrel=1
pkgdesc="Mirobridge is python script integrating mythtv and miro"
arch=('i686')
url="http://www.mythtv.org/wiki/MiroBridge"
license=('GPL')
depends=('miro' 'mysql-python' 'python' 'mythtv-svn')

source=(http://svn.mythtv.org/trac/raw-attachment/ticket/6825/mirobridge_v$pkgver.tar.gz)
md5sums=('3d4d3c12f554a8f068f20cc976ff56d0')

build() {
   cd $startdir/src
   mkdir -p ${startdir}/pkg/opt/mirobridge
   cp -a . ${startdir}/pkg/opt/mirobridge/
   rm ${startdir}/pkg/opt/mirobridge/mirobridge_v$pkgver.tar.gz
}
