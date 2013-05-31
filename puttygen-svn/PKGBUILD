pkgname=puttygen-svn
_svnname=putty
pkgver=9846      
pkgrel=1
pkgdesc="Manage rsa keys for use with putty"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.chiark.greenend.org.uk/~sgtatham/putty"
license=('MIT')
makedepends=('subversion' 'zip')
source=('svn://svn.tartarus.org/sgt/putty')
md5sums=('SKIP')

build() {
	cd $_svnname
	./mkfiles.pl	
	cd unix
	make -f Makefile.ux puttygen || return 1
}

package() {
	cd $_svnname/unix
	mkdir -p $pkgdir/usr/bin
  	#install -Dm755 putty puttygen puttytel pterm psftp pscp plink $pkgdir/usr/bin || return 1
  	install -Dm755 puttygen $pkgdir/usr/bin || return 1
	install -Dm644 ../LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

pkgver() {
	cd $startdir/$_svnname
	svnversion | tr -d [A-z]
}
