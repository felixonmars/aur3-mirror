# Contributor: Corey Ling <kasuko@gmail.com>

pkgname=pyxis
pkgver=0.2.1
pkgrel=2
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
md5sums=('face4099f5bcc136d5fd21c24a577279'
         '3096a832aac9e155cd21e2d108168516')

build() {
	cd $srcdir/Kasuko-pyxis*
	patch -p0 < ../../python2.patch
	python2 setup.py install --root=$pkgdir
}

