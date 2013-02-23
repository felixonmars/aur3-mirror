pkgname=gmapcatcher-svn
pkgver=1568
pkgrel=1
pkgdesc="GMapCatcher is an offline maps viewer"
arch=(any)
url="http://code.google.com/p/gmapcatcher"
license=('GPL2')
depends=('python2' 'pygtk' 'gtk2' 'python2-cairo' 'python2-gobject2')
makedepends=(subversion)
provides=(gmapcatcher)
source=('gmapcatcher.desktop' 'gmapcatcher.png')
md5sums=('2da3b301f56c0303ba8d67e45ea44019' 'bc0ce84192f1a60087662310c24cab8f') 

_svntrunk="http://gmapcatcher.googlecode.com/svn/trunk"
_svnmod=gmapcatcher

build() {
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/share/pixmaps
mkdir -p $pkgdir/opt
mkdir -p $pkgdir/usr/share/applications
cd $srcdir
msg "Connecting to SVN server...."
svn checkout http://gmapcatcher.googlecode.com/svn/trunk gmapcatcher
msg "SVN checkout done or server timeout"
svn export gmapcatcher $pkgdir/usr/share/gmapcatcher
rm -r $pkgdir/usr/share/gmapcatcher/{common,installer} 
ln -s "/usr/share/gmapcatcher/maps.py" $pkgdir/usr/bin/gmapcatcher
ln -s "/usr/share/gmapcatcher/download.py" $pkgdir/usr/bin/gmapcatcher-download
cp $startdir/gmapcatcher.desktop $pkgdir/usr/share/applications/gmapcatcher.desktop
chmod +x $pkgdir/usr/share/applications/gmapcatcher.desktop
cp $startdir/gmapcatcher.png $pkgdir/usr/share/pixmaps
#replace python for python2 in env line
for i in ${pkgdir}/usr/share/gmapcatcher/*.py; do sed -i '1 s/python/python2/g' "$i"; done
}
