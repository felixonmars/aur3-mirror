# Maintainer: Calvin Morrison <mutantturkey@gmail.com>
# Contributor:  Dannny <danny.a95@gmail.com>

pkgname=svte-hg
pkgver=20100717
pkgrel=2
pkgdesc="simple virtual terminal emulator: A minimal, tabbed, VTE-based terminal"
arch=('i686' 'x86_64')
url="http://code.google.com/p/svte/"
license=('GPL')
depends=('gtk2' 'vte')
makedepends=('mercurial')
conflicts=('svte')

_hgroot=http://svte.googlecode.com/hg/
_hgrepo=svte

build() {
  cd $srcdir

  	if [ -d ${_hgrepo} ]; then
		cd ${startdir}/src/${_hgrepo}
		hg pull -u
	else
		hg clone ${_hgroot}${_hgrepo} || return 1
		cd ${startdir}/src/${_hgrepo}
	fi

  msg "Mercurial clone done or server timeout"
  msg "Starting make..."

	make || return 1
	make DESTDIR=${pkgdir} install


}
