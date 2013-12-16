# Maintainer: Kevin Cox <kevincox@kevincox.ca>
pkgname='path-git'
pkgver=0.0.0
pkgrel=1
pkgdesc='A tool for manipulating paths from within shell scripts.'
arch=('i686' 'x86_64')
url='https://github.com/kevincox/path'
license=('MIT style')
depends=()
makedepends=('git' 'rub-build')
provides=('path')
source=('git+https://github.com/kevincox/path.git')
sha1sums=('SKIP')

_defflags()
{
	_flags=("-Dprefix=$pkgdir/usr/")
}

pkgver()
{
	cd "$srcdir/path"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build()
{
	_defflags
	cd "$srcdir/path"
	rub0 "${_flags[@]}"
}

package()
{
	_defflags
	cd "$srcdir/path"
	rub0 "${_flags[@]}" :install
}

check()
{
	_defflags
	cd "$srcdir/path"
	rub0 "${_flags[@]}" :test
}
