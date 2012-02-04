# Maintainer: <jonny@fsk141.com> 

pkgname=desktop-flickr-organizer
_pkgname=desktopflickrorganizer
pkgver=0.8
pkgrel=3
pkgdesc="Organize your Flickr account"
arch=('i686' 'x86_64')
url="http://code.google.com/p/dfo/"
license=('GPL')
depends=('mono' 'glade' 'gtk-sharp-2' 'gnome-sharp' 'subversion')
source=('desktop-flickr-organizer' 
	'desktop-flickr-organizer.desktop')

md5sums=('6a3fdb50a9951375dd9cbc5920a9778f'
         '1d4a4091f64f8fc41adce53987bf6f9b')

install=dfo.install

_svntrunk="http://dfo.googlecode.com/svn/trunk"
_svnmod=dfo-read-only
                  
build() {

	export MONO_SHARED_DIR=${srcdir}/mono_share
	mkdir -p "${MONO_SHARED_DIR}"
	
	# Checkout SVN (Since 0.8 is borked)
	cd $startdir/src
	msg "Connecting to SVN server...."
		if [ -d $_svnmod/.svn ]; then
			(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	svn export $_svnmod $_svnmod-build
	
	# Move to working directory
	cd $_svnmod-build
	
	# Build DFO
	sh ./compile.sh	

	# Create install dirs & install with correct permissions
	install -d $pkgdir/usr/{lib/$pkgname/icons,bin,share/applications}
	cp -r icons/* $pkgdir/usr/lib/$pkgname/icons/
	cp -r lib/FlickrNet.dll $pkgdir/usr/lib/
	install -Dm755 $srcdir/desktop-flickr-organizer $pkgdir/usr/bin/
	install -Dm644 $srcdir/desktop-flickr-organizer.desktop $pkgdir/usr/share/applications/
	install -Dm755 Main.exe $pkgdir/usr/lib/$pkgname
}
