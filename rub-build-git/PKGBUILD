# Maintainer: Kevin Cox <kevincox@kevincox.ca>
pkgname='rub-build-git'
pkgver=0.0.0
pkgrel=1
pkgdesc='A cross-platform language independent build framework.'
arch=('i686' 'x86_64')
url='https://github.com/kevincox/rub'
license=('MIT style')
depends=(
          'ruby'
          'ruby-sysexits'    # Ruby gems, install with pacgem.
          'ruby-xdg'         #
          'ruby-valid-array' #
        )
optdepends=('ruby-minitest>=5: For L::Test (install it with pacgem).')
makedepends=('git')
provides=('rub-build')
source=('git+https://github.com/kevincox/rub.git')
sha1sums=('SKIP')

pkgver()
{
	cd "$srcdir/rub"
	ruby bin/rub.rb --version-version-commit
}

build()
{
	cd "$srcdir/rub"
	ruby bin/rub.rb "-Dprefix=$pkgdir/usr/"
}

package()
{
	cd "$srcdir/rub"
	ruby bin/rub.rb "-Dprefix=$pkgdir/usr/" :install
}

