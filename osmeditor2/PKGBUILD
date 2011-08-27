# Contributor : Michel Brabants <michel.brabants@euphonynet.be>

pkgname=osmeditor2
pkgver=20061209
pkgrel=1
pkgdesc="osmeditor2 is a standalone live OSM editor, designed to be a 'one-pot' program to read data from your GPS and perform live construction of OSM nodes, segments and ways from GPS-surveyed data. The user interface is geared towards mapping UK countryside areas but can potentially be used anywhere."
url="http://wiki.openstreetmap.org/index.php/Osmeditor#Obtaining"
license="GPL"
depends=('qt>=3.0' 'curl')
makedepends=('subversion')
source=(Makefile.patch)
md5sums=('66085788e81a42268f5303ecb3c230c8')

_svnroot=http://svn.openstreetmap.org
_svnpath=editors/osm-editor/qt3

build() {
 cd $startdir/src
msg "Connecting to openstreetmap subversion-server...."
svn co $_svnroot/$_svnpath
msg "Subversion checkout done or server timeout"

cd $startdir/src/qt3
msg "Patching Makefile"
patch -N Makefile $startdir/src/Makefile.patch

msg "Starting make..."
make QTPREFIX=/opt/qt prefix=/usr osmeditor2 || return 1
make prefix=/usr DESTDIR=$startdir/pkg install

# Libtool slay
find $startdir/pkg/ -iname *.la -exec rm -f {} \;

}

# vim: ft=sh

