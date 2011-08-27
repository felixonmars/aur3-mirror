# Contributor: Heikki Mehtänen <heikki@mehtanen.fi>

pkgname=ptr-git
pkgver=20100129
pkgrel=1
pkgdesc="CLI translating tool supporting multiple languages"
url="http://ilmainensanakirja.fi/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('perl-html-parser')
makedepends=('git')
provides=('ptr')
conflicts=('ptr')

_gitroot="http://git.mehtanen.fi/ptr.git"
_gitname="ptr"

build() {
	cd $srcdir

	msg "connecting to git.mehtanen.fi git server"
	if [ -d $srcdir/$_gitname ] ; then
		cd $_gitname && git pull origin || return 1
	else
		git clone $_gitroot $_gitname || return 1
	fi
	msg "git checkout done"
	msg "building deps"
	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	for i in Google-Translate ilmainensanakirja; do
		msg "Building ptr $i module"
		cd "lib/$i"
		perl Makefile.PL
		make
		make DESTDIR=$pkgdir install
		cd "$srcdir/$_gitname-build"
	done

	msg "installing globally"
	install -m755 -D $srcdir/$_gitname/$_gitname $pkgdir/usr/bin/$_gitname
}
