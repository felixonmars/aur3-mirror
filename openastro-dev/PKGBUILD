pkgname='openastro-dev'
pkgver='1.1.25'
pkgrel='3'
pkgdesc='OpenAstro is an open source fully featured astrology software.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.openastro.org/'
depends=('imagemagick' 'pyswisseph' 'python2-dateutil' 'python-rsvg' 'swisseph_18' 'swisseph-fixstars')
makedepends=('git' 'setuptools')
optdepends=('swisseph-all: All data files of the swiss ephemeris.')
conflicts='openastro'
replaces='openastro'
source=()
md5sums=()

build() {
	cd $srcdir/
	if [[ -d 'openastro-dev' ]] ; then
	git-pull origin || return 1
	else
	git clone http://github.com/pascallemazurier/openastro-dev || return 1
	fi
	cd openastro-dev
	python2 setup.py install --root=$pkgdir || return 1
}
