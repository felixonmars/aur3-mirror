# Contributor: William Rea <sillywilly@gmail.com>
pkgname=gshrooms
pkgver=20051009
pkgrel=1
pkgdesc="gShrooms Music Sharing"
url="http://raphael.slinckx.net/gshrooms.php"
depends=('gst-plugins' 'soappy' 'nattraverso' 'python-twisted' 'gaim')
source=()
md5sums=()
_cvsroot=":pserver:anoncvs@anoncvs.gnome.org:/cvs/gnome"
_cvsmod="gshrooms"

build() {
  cd $startdir/src
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
  cd $_cvsmod

  msg "CVS checkout done or server timeout"
  msg "Starting make..."


  ./autogen.sh --prefix=/usr --with-gconf-schema-file-dir=/etc/gconf
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
