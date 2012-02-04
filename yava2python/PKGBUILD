# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com
pkgname=yava2python
pkgver=1.1
pkgrel=1
pkgdesc="A Java to python translator" 
url="http://macroexpand.org/doku.php/txl:projects:yava2python:start"
license=("unknown" )
arch=(i686)
depends=() 
source=(http://macroexpand.org/projects/yava2python/yava2python.tar.bz2)
md5sums=('becb5b538cd1cb65126ea0b5afc12d08')

build() { 
	cd $startdir/src/$pkgname 
	install -d $startdir/pkg/usr/bin/
  	install -m 755 $pkgname $startdir/pkg/usr/bin/ 
}
