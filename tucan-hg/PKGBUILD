# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

_pkgname=tucan
pkgname=tucan-hg
pkgver=1388.2484aa0a0aad
pkgrel=1
pkgdesc="Download and upload manager for hosting sites like JDownloader, but in GTK. Mercurial branch."
arch=('any')
url='http://tucaneando.com/index.html'
license=('LGPL3')
depends=('python2-imaging' 'python2' 'pygtk' 'tesseract' 'python2-poster')
optdepends=('librsvg')
makedepends=('mercurial')
provides=('tucan')
conflicts=('tucan')
source=('hg+https://code.google.com/p/tucan/')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  echo $(hg identify -n).$(hg identify -i)
}

build() {
	cd "${srcdir}/${_pkgname}/src"

	# python2 fix
	sed -i 's_usr/bin/env python_usr/bin/env python2_' tucan.py
}

package() {
	cd "${srcdir}/${_pkgname}/src"

	make DESTDIR=$pkgdir/usr install
	ln -sf /usr/share/tucan/tucan.py $pkgdir/usr/bin/tucan
}



