# Contributor: weirdfox <weirdfox@gmail.com>
pkgname=stdin-plasmoid-svn
pkgver=0.2r32
pkgrel=1
pkgdesc="This plasmoid executes a process and captures its stdout or stderr output stream, it can also display the content of a local file or a remote file via KIO."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/STDIN+Plasmoid?content=92309"
license=('GPL')
depends=('kdelibs' 'kdebase-runtime' 'kdebase-workspace')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install

build() {
	cd $startdir/src
	svn co https://plasmoidstdin.svn.sourceforge.net/svnroot/plasmoidstdin/0.2/trunk stdin -r32
	cd stdin
	cmake . -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}

