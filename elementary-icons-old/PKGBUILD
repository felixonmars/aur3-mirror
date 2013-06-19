# Mantainer: Diego <cdprincipeat gmaildot com>
# Contributor: paterbrown <paterbrown at silberhelme dot de>
# Contributor: Josip <josipponjavic at gmail dot com>

pkgname=elementary-icons-old
_pkgname=elementary-icon-theme
pkgver=2.7.1
pkgrel=1
pkgdesc="icon theme designed to be smooth, sexy, clear, and efficient."
arch=('any')
url="https://launchpad.net/elementaryicons"
license=('GPL2')
depends=('librsvg')
provides=('elementary-icons')
conflicts=('elementary-icons' 'elementary-icons-bzr')
source=(https://launchpad.net/elementaryicons/2.0/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz)
md5sums=('fc4580641089a09cbcf7df38ebddd807')

package() {
	cd ${srcdir}/${_pkgname}/elementary/panel/22
	for i in audio*-panel.svg; do ln -s "$i" "${i%-panel.svg}.svg"; done

	cd ${srcdir}/${_pkgname}/elementary/apps/16
	ln -s ooo-base.svg libreoffice-base.svg 
	cd ${srcdir}/${_pkgname}/elementary/apps/24
	for i in impress calc writer; do ln -s "ooo-$i.svg" "libreoffice-$i.svg"; done
	cd ${srcdir}/${_pkgname}/elementary/apps/48
	for i in base impress calc writer; do ln -s "ooo-$i.svg" "libreoffice-$i.svg"; done

	cd ${srcdir}/${_pkgname}/elementary-mono-dark/panel/22
	for i in audio*-panel.svg; do ln -s "$i" "${i%-panel.svg}.svg"; done

	mkdir -p ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/${_pkgname}/elementary ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/${_pkgname}/elementary-mono-dark ${pkgdir}/usr/share/icons
}


