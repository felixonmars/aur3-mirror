# Contributor: Corey Ling <kasuko@gmail.com>

pkgname=pyxis
pkgver=0.2.3
pkgrel=1
pkgdesc="SIRIUS/XM Internet Radio Player for Command Line"
url="http://www.ionshard.com/pyxis"
arch=(i686 x86_64)
license=('GPL')
depends=('python-beautifulsoup' 'mplayer' 'python2')
makedepends=('python2' 'setuptools')
optdepends=('python-notify: for OSD notifications')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=( "https://github.com/Kasuko/pyxis/tarball/v$pkgver" "python2.patch" )

build() {
	cd $srcdir/Kasuko-pyxis*
	patch -p0 < ../../python2.patch
	python2 setup.py install --root=$pkgdir
}

md5sums=('b2f42dc7bb5e2a0a6c0ef0ff6f327790'
         '3096a832aac9e155cd21e2d108168516')
