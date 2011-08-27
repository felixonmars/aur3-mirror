# Contributor: riverscn<riverscn at gmail.com>
# Contributor: Lee.MaRS<leemars at gmail.com>
pkgname=ibus-chewing-git
pkgver=20110728
pkgrel=1
pkgdesc="The Chewing engine for IBus"
arch=('i686' 'x86_64')
url="https://github.com/definite/ibus-chewing"
license=('LGPL')
depends=('cmake' 'gob2' 'ibus')
#provides=('ibus-table=1.3.0')
conflicts=('ibus-chewing')
makedepends=('git' 'cvs')
options=('!libtool')
source=(https://fedorahosted.org/releases/c/m/cmake-fedora/cmake-fedora-modules-only-latest.tar.gz)
md5sums=('1e4db1927fb261cb2b8909a9f5c266bd')
install=ibus-chewing.install

_gitroot="https://github.com/definite/ibus-chewing.git"
_gitname="ibus-chewing"

build()
{
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
	cd $_gitname && git pull origin master
	msg "The local files are updated."
	else
	git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	tar zxvf $srcdir/cmake-fedora-modules-only-latest.tar.gz

	cmake . -DCMAKE_INSTALL_PREFIX='/usr' -DLIBEXEC_DIR='/usr/libexec'

	make || return 1
}

package()
{
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir/" install
	mv -f $pkgdir/gconf $pkgdir/usr/share/
}
