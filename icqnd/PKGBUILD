# Contributor: Armin Luntzer <a0049387@unet.univie.ac.at>
pkgname=icqnd
pkgver=0.2
pkgrel=1
pkgdesc="icqnd is a GTK-2 GUI for the popular ICQ program Licq" 
arch=(i686 x86_64 ppc)
url="http://icqnd.sourceforge.net/"
license="GPL"
depends=('gtk2' 'licq')
source=(http://dl.sourceforge.net/sourceforge/icqnd/icqnd-${pkgver}BETA.tar.bz2)

md5sums=('64abb0dcffc458e7db5ee5fedaadfb2f')
build() {
  cd $startdir/src/${pkgver}BETA

  ./configure --prefix=/usr
  
  make || return 1
  make DESTDIR=$startdir/pkg install
 
  find $startdir/pkg -name "*.la" -exec rm -f {} \;
}
