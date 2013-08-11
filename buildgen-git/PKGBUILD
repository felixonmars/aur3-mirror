# Maintainer: Kevin Cox <kevincox@kevincox.ca>
pkgname='buildgen-git'
pkgver='0.0.0'
pkgrel=1
pkgdesc='Cross-platform build script generator.'
arch=('i686' 'x86_64')
url='https://github.com/buildgen'
license=('MIT style')
depends=('lua')
optdepends=('luafilesystem: Needed somewhere on the system.'
            'lua-penlight:  Needed somewhere on the system.')
makedepends=('cmake' 'git' 'gtest')
provides=('buildgen')
source=('git+https://kevincox@github.com/buildgen/buildgen.git')
sha1sums=('SKIP')

pkgver()
{
	git describe --always --dirty
}

build()
{
	cd 'buildgen'
	cmake "-DCMAKE_INSTALL_PREFIX=$pkgdir/usr"
}

package()
{
	cd 'buildgen'
	make install
}
