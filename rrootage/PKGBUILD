# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_ com>
pkgname=rrootage
pkgver=0.23a
pkgrel=5
pkgdesc="An addictive game by Kenta Cho.  An abstract shooter with plenty of action!"
arch=('i686' 'x86_64')
url="http://rrootage.sourceforge.net/"
license=('custom')
depends=('mesa' 'sdl_mixer' 'libbulletml')
source=(http://downloads.sourceforge.net/rrootage/rRootage-0.23a.tar.gz
		http://ftp.de.debian.org/debian/pool/main/r/rrootage/rrootage_0.23a-9.diff.gz)

build() {

cd $srcdir/rRootage
patch -p1 <../rrootage_0.23a-9.diff
while read x;do [[ `echo $x | head -c1` != '#' ]] && patch -p1 <debian/patches/"$x";done <debian/patches/series
sed -i s,"\/games",,g ./src/screen.c ./src/barragemanager.cc ./src/soundmanager.c ./install.sh ./debian/rules ./readme_linux
sed -i s,"\/games","\/usr",g ./debian/menu

cd src
make -f makefile.lin || return 1
mkdir -p $pkgdir/usr/share/rrootage
cp -r $srcdir/rRootage/rr_share/* $pkgdir/usr/share/rrootage/
install -D -m755 $srcdir/rRootage/src/rrootage $pkgdir/usr/bin/rrootage
install -D -m644 $srcdir/rRootage/debian/rrootage.desktop $pkgdir/usr/share/applications/rrootage.desktop
install -D -m644 $srcdir/rRootage/debian/rrootage.xpm $pkgdir/usr/share/pixmaps/rrootage.xpm
install -D -m644 $srcdir/rRootage/readme_e.txt $pkgdir/usr/share/licenses/rrootage/readme_e.txt
}
md5sums=('fb12876d703594d915ec43a56bd9ce62'
         'eca5212729551d290f9800cad3046581')
