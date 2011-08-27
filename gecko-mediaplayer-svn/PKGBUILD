# Maintainer: evr <evanroman at gmail>
# Contributor: Jorge Mokross <mokross@gmail.com>
pkgname=gecko-mediaplayer-svn
pkgver=367
pkgrel=1
pkgdesc="A browser plugin that uses GNOME Mplayer."
url="http://kdekorte.googlepages.com/gecko-mediaplayer"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('gnome-mplayer-svn')
makedepends=('xulrunner' 'pkgconfig')
conflicts=('gecko-mediaplayer' 'gecko-mediaplayer-cvs')
provides=('gecko-mediaplayer')

_svntrunk=http://gecko-mediaplayer.googlecode.com/svn/trunk
_svnmod=gecko-mediaplayer-read-only

build() {
	cd $srcdir
	
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  cd $_svnmod
  
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

