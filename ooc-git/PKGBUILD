pkgname=ooc-git
pkgver=20091016
pkgrel=1
pkgdesc="an object-orientend programming language"
arch=('i686' 'x86_64')
license=('GPL')
url="http://ooc-lang.org/"
depends=('jdk')
makedepends=('git' 'apache-ant')
source=()
md5sums=()

_gitroot="git://github.com/nddrylliog/ooc.git"
_gitname="ooc"
_ant="/usr/share/java/apache-ant/bin/ant"

build()
{
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Start build..."

	rm -rf "$srcdir/$pkgname-$pkgver"
	cp -r "$srcdir/$_gitname" "$srcdir/$pkgname-$pkgver"
	cd "$srcdir/$pkgname-$pkgver"

	$_ant

	install -d $pkgdir/opt/ooc/ || return 1
	install -D -m755 utils/ooc $pkgdir/usr/bin/ooc || return 1
	cp -rp bin $pkgdir/opt/ooc || return 1
	cp -rp libs $pkgdir/opt/ooc || return 1
	cp -rp sdk $pkgdir/opt/ooc || return 1
}
