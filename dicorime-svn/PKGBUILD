# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=dicorime-svn
pkgrealname=dicorime
pkgver=109
pkgrel=1
pkgdesc="French rime dictionary"
arch=(i686 x86_64)
url="http://ignu.ungi.com/tiki-index.php?page=dictionnaire+de+rimes"
license=('gpl')
depends=('qt')
makedepends=('subversion')
#provides=()
#conflicts=()
source=()
md5sums=('')

_svntrunk=http://dev.ignu.fr/qdicorime/trunk 
_svnmod=dicorime

build() {
	
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done (or server timeout)"
  msg "Starting make..."

  rm -rf "$_svnmod-build"
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

 
	qmake
	make
	make DESTDIR=$pkgdir install || return 1
	
	#deploy
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/dicorime/base/
	
	cp $srcdir/$_svnmod-build/bin/dicorime $pkgdir/usr/bin/
	cp -fr $srcdir/$_svnmod-build/base/*.db $pkgdir/usr/share/dicorime/base/
	

 #desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/$_svnmod-build/src/images/${pkgrealname}128.png $pkgdir/usr/share/pixmaps/$pkgrealname.png
	
	install -D -m644 $srcdir/../$pkgrealname.desktop $pkgdir/usr/share/applications/$pkgrealname.desktop

}


