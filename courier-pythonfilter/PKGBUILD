# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Maintainer: Nathan Owe. <ndowens04+AUR @ gmail.com>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=courier-pythonfilter
pkgver=1.8
pkgrel=2
pkgdesc="Python filtering architecture for the Courier MTA."
arch=('i686' 'x86_64')
url='http://www.dragonsdawn.net/~gordon/courier-patches/courier-pythonfilter/'
license=('GPL3')
depends=('python' 'courier-mta')
optdepends=('pyclamav' 'pydns' 'pyspf')
backup=('etc/pythonfilter.conf' 'etc/pythonfilter-modules.conf')
options=('emptydirs')
source=(http://www.dragonsdawn.net/~gordon/courier-patches/courier-pythonfilter/$pkgname-$pkgver.tar.gz)
sha512sums=('fcfdbc6456c149995cf6f56783677e427b6f44a0c6dfb99f0b2271fc0ff20facbda64e58d3bb92a9a4c4e0df3bb9a193812115b803cf5f6e2c87b0c069b603c6')

build() {
	cd $srcdir/$pkgname-$pkgver

  install -d  $pkgdir/var/lib/{pythonfilter,filters}
	python setup.py install --root=$pkgdir/
  }
