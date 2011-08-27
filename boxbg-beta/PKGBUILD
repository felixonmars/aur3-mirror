# Maintainer: webnull < babciastefa@gmail.com >

pkgname=boxbg-beta
pkgver=1.0
pkgrel=1
url=http://code.google.com/p/boxbg/
pkgdesc="Lightweight wallpaper script, that uses feh to manage wallpaper on your *box* desktop."
arch=('i686')
depends=('feh' 'subversion')
provides=('boxbg-beta')
conflicts=('boxbg-beta')
license=('GPL')

  source=( 'http://boxbg.googlecode.com/files/install.sh' )
  md5sums=( 'aa0f3447469fef19457182b44b45148d' )

build() {
	msg "Creating directories..."
	mkdir -p $startdir/pkg/usr/bin
	mkdir -p $startdir/tmp

	msg "Downloading from SVN..."
	svn checkout http://boxbg.googlecode.com/svn/trunk/ $startdir/tmp

	msg "Copying files..."
	cp $startdir/tmp/boxbg $startdir/pkg/usr/bin/boxbg

	msg "Deleting temporary folder..."
	rm -R $startdir/tmp
	rm $startdir/src -R
	rm $startdir/install.sh
}
