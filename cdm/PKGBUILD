# Maintainer: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=cdm
pkgver=0.5.3
pkgrel=1
pkgdesc="The Console Display Manager"
arch=('any')
url="http://cdm.ghost1227.com/X11"
license=('GPL')
depends=('dialog')
backup=(etc/cdmrc)
source=(http://cdm.ghost1227.com/repo/cdm-${pkgver}.tar.gz)
md5sums=('9a7b00559cfc72f761ad172819c61c7f')

build() {
	/bin/true
}

package() {
	cd ${srcdir}/cdm-${pkgver}/src

	mkdir -p ${pkgdir}/usr/{bin,share/cdm}
	install -m755 ${pkgname} ${pkgdir}/usr/bin/
	install -Dm644 cdmrc ${pkgdir}/etc/cdmrc
	install -m644 xinitrc* ${pkgdir}/usr/share/cdm/
	install -Dm755 zzz-cdm-profile.sh \
		${pkgdir}/etc/profile.d/zzz-cdm-profile.sh
	cp -Rf themes ${pkgdir}/usr/share/cdm/
}
