pkgname=muttils-hg
pkgver=r851.04f5de312588
pkgrel=1
pkgdesc="Python utilities for console mail clients (eg. Mutt)"
url="http://www.blacktrash.org/hg/muttils/"
arch=(i686 x86_64)
license=('GPL')
depends=('python2')
makedepends=('mercurial')
conflicts=('muttils')
provides=('muttils')
_hgrepo=muttils
source=('hg+http://www.blacktrash.org/hg/muttils')
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/${_hgrepo}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd $srcdir

	msg "Copying files"
	rm -r ${_hgrepo}-build || true                                                                                          
	cp -r ${_hgrepo} ${_hgrepo}-build

	cd ${srcdir}/${_hgrepo}-build

	sed -i 's/python/python2/' Makefile

	make PYTHON=python2
}

package() {
	cd ${srcdir}/${_hgrepo}-build

	make PYTHON=python2 PREFIX=${pkgdir}/usr install
}
