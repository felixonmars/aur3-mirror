
_pkgname=cowsay
pkgname=cowsay-utf8
pkgver=3.03
pkgrel=9
pkgdesc='Configurable talking cow (and a few other creatures)'
arch=('any')
url='http://www.nog.net/~tony/warez/'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
license=('PerlArtistic' 'GPL')
depends=('perl')
source=(ftp://ftp.netbsd.org/pub/pkgsrc/distfiles/${_pkgname}-${pkgver}.tar.gz
        cowsay-install.patch cowsay.patch)
sha256sums=('0b8672a7ac2b51183780db72618b42af8ec1ce02f6c05fe612510b650540b2af'
            'aa88442a31f01ffe5884b3ae974ed1ced23d860859d7f2234cdcd3ac437fc17f'
            '0cc2901cdaab338fb2fe233cf685503ed293d7c08a80910fc8d8eaa335ee25fd')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	patch < $srcdir/cowsay.patch
	patch < $srcdir/cowsay-install.patch
	sed -i 's|/man/|/share/man/|' install.sh
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	echo "${pkgdir}/usr" | ./install.sh
	# This one is not a valid '.cow' file
	rm ${pkgdir}/usr/share/cows/mech-and-cow
}
