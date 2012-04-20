# $Id$
# Contributer: Barry User <barry@user.com>
# Maintainer: Harry Hacker <harry@hacker.com>

pkgname=gbtiler
pkgver=2.1
pkgrel=1
pkgdesc="A utility for offsetting and merging gerber and NC drill files"
arch=('any')
url="http://gbtiler.sourceforge.net/gbtiler-manual-2p0.html"
license=('GPL' 'Artistic')
depends=('perl>=5')
source=("http://downloads.sourceforge.net/project/gbtiler/gbtiler/gbtiler-2p1-beta/gbtiler2.tar.gz")
md5sums=("b0a0aecadcb2e513345240e712192a47")
options=(!emptydirs)

build() {
	cd "${srcdir}/gbtiler2"
	# Install module into the vendor directories.
	perl Makefile.PL INSTALLDIRS=vendor
	make
}

package() {
	cd "${srcdir}/gbtiler2"
	make DESTDIR="${pkgdir}" install

	# Remove .packlist and perllocal.pod files.
	find "${pkgdir}" -name '.packlist' -delete
}
