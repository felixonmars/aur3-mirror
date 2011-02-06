pkgname=oxygencursors-debian
pkgver=0.0.20080707svn8248491debian
pkgrel=1
pkgdesc="Oxygen Cursor themes from Debian Repository"
arch=('i686' 'x86_64')
url="http://packages.debian.org/squeeze/oxygencursors"
license=('GPL')
depends=('deb2targz')
source=(http://ftp.debian.org/debian/pool/main/o/oxygencursors/oxygencursors_0.0.2008-07-07-svn824849-1_all.deb)
md5sums=('550a5902f7dcc02774368bc7c9b63df0') 

build() {
   deb2targz oxygencursors_0.0.2008-07-07-svn824849-1_all.deb
   tar xzf oxygencursors_0.0.2008-07-07-svn824849-1_all.tar.gz
   cp -r usr $pkgdir
   cp -r etc $pkgdir
   rm -rf $pkgdir/usr/share/doc
   cd $pkgdir/usr/share/icons/
   rm -rf ./default
   ls | while read LSO; do
   RNAME=$(echo $LSO | sed 's/oxy-/Oxygen_/g' | sed 's/_./\U&/')
   mv $LSO ./$RNAME
   done
   cd $pkgdir/etc/X11/cursors/
   ls | while read LSOT; do
   RNAMET=$(echo $LSOT | sed 's/oxy-/Oxygen_/g' | sed 's/_./\U&/')
   cat $LSOT | sed 's/oxy-/Oxygen_/g' | sed 's/_./\U&/' > $RNAMET	
   rm $LSOT
   done
   }

