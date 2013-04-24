# Contributor: Sebastian Wolf <fatmike303 <at> gmail.com>
pkgname=putty-svn
_svnname=putty
pkgver=9835      
pkgrel=1
pkgdesc="A client program for the SSH, Telnet and Rlogin network protocols"
arch=('i686' 'x86_64')
url="http://www.chiark.greenend.org.uk/~sgtatham/putty"
license=('MIT')
depends=('gtk2')
makedepends=('subversion' 'zip')
conficts=('putty')
provides=('putty')
source=('svn://svn.tartarus.org/sgt/putty')
md5sums=('SKIP')

build() {
	cd $_svnname
	./mkfiles.pl	
	cd unix
	make -f Makefile.gtk || return 1
}

package() {
	cd $_svnname/unix
	mkdir -p $pkgdir/usr/bin
  	install -Dm755 putty puttygen puttytel pterm psftp pscp plink $pkgdir/usr/bin || return 1
	install -Dm644 ../LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

pkgver() {
	cd $startdir/$_svnname
	svnversion | tr -d [A-z]
}
