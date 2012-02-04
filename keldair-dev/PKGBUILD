# Maintainer: Matthew <matthew@matt-tech.info>
pkgname=keldair-dev
pkgver=124
pkgrel=1
pkgdesc="Keldair IRC framework. Redesigned, for the modern age."
url="http://dev.woomoo.org"
arch=('any')
license=('BSD')
makedepends=('mercurial')
depends=('perl-file-copy-recursive' 'perl-io-socket-ssl' 'perl-io-socket-ip' 'perl-mouse' 'perl' 'perl-furl')
source=()
md5sums=()
conflicts=()
optdepends=()
provides=()
_hgroot="http://hg.woomoo.org/repos"
_hgrepo="keldair"
install=keldair.install

build() {
	cd ${startdir}/src
	if [ -d ${_hgrepo} ]; then
		cd ${startdir}/src/${_hgrepo}
		hg pull -u
	else
		hg clone ${_hgroot}${_hgrepo} || return 1
		cd ${startdir}/src/${_hgrepo}
	fi
	msg "Mercurial checkout done or server timeout."
	msg "Building..."
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib/perl5/site_perl
	mkdir -p $pkgdir/etc
	rm -rf ${startdir}/src/${_hgrepo}-build
	cp -R ${startdir}/src/${_hgrepo} ${startdir}/src/${_hgrepo}-build
	cd ${startdir}/src/${_hgrepo}-build
}

package() {
	cd ${startdir}/src/${_hgrepo}-build
	./setup -s -p=$pkgdir
	rm -rf ${startdir}/src/${_hgrepo}-build
}
