# Contributor: Daniel Isenmann <daniel.isenmann [at] gmx.de>
pkgname=fsviewer
pkgver=0.2.5
pkgrel=2
pkgdesc="FSViewer is a (visually and functionally in analogy to the Workspace Manager of NeXTStep(TM)) file system viewer for WindowMaker"
url="http://www.bayernline.de/~gscholz/linux/fsviewer/"
license="GPL"
depends=('windowmaker')
source=(http://www.bayernline.de/~gscholz/linux/fsviewer/FSViewer.app-$pkgver.tar.gz fsviewer.diff)
md5sums=('d1f849d1f955c35b18201860e485d332' '42990483538b9e7f156739209b9817d2')

build() {
  cd $startdir/src
  patch -p0 < fsviewer.diff
  
  cd $startdir/src/FSViewer.app-$pkgver  
  ./configure --with-appspath=/usr/share/GNUstep/Applications \
	      --with-extralibs=-lXft \
	      --disable-clk 
  make || return 1
  make DESTDIR=$startdir/pkg install
}
