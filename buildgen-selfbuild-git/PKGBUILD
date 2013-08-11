# Maintainer: Kevin Cox <kevincox@kevincox.ca>
pkgname='buildgen-selfbuild-git'
pkgver='0.0.0'
pkgrel=1
pkgdesc='Cross-platform build script generator.  Building itself.'
arch=('i686' 'x86_64')
url='https://gitorious.org/buildgen'
license=('MIT style')
depends=('lua')
optdepends=('luafilesystem: Needed somewhere on system.'
            'lua-penlight:  Needed somewhere on system.')
makedepends=('buildgen' 'git')
provides=('buildgen' 'gtest')
source=('git+https://github.com/buildgen/buildgen.git')
sha1sums=('SKIP')

pkgver()
{
	git describe --always --dirty
}

build()
{
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"

	gen "-Dprefix=$pkgdir/usr/" -o "b.xml" "$srcdir/buildgen"
	gen-makefile "b.xml"
	make
}

package()
{
	cd "$srcdir/build"
	make install
}

