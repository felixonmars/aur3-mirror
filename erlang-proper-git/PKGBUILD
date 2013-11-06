# Maintainer: Chris Sakalis <chrissakalis@gmail.com>

pkgname='erlang-proper-git'
pkgver=20131027
pkgrel=1
pkgdesc='A QuickCheck-inspired property-based testing tool for Erlang'
arch=('any')
url='http://proper.softlab.ntua.gr/'
license=('GPL3')
depends=(erlang)
provides=(erlang-proper)
conflicts=(erlang-proper)
source=('git+https://github.com/manopapad/proper.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver()
{
	cd "$srcdir/proper"
	git show -s --format="%ci" HEAD | cut -f1 -d" " | sed 's\-\\g'
}

build()
{
	cd "$srcdir/proper"
	make fast
	make doc
}

package()
{
	cd "$srcdir/proper"
	mkdir -p "$pkgdir/usr/lib/erlang/lib/proper"
	cp -R doc "$pkgdir/usr/lib/erlang/lib/proper"
	cp -R ebin "$pkgdir/usr/lib/erlang/lib/proper"
	cp -R examples "$pkgdir/usr/lib/erlang/lib/proper"
	cp -R include "$pkgdir/usr/lib/erlang/lib/proper"
	cp -R src "$pkgdir/usr/lib/erlang/lib/proper"
	cd "$srcdir"
}

