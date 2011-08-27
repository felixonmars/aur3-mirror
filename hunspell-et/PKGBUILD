pkgname=hunspell-et
pkgver=0.1
pkgrel=1
pkgdesc='Estonian dictionary for Hunspell'
arch=('any')
url="http://wiki.services.openoffice.org/wiki/Dictionaries#Estonian_.28Estonia.29"
license=('GPL')
#makedepend=(sed)
optdepends=('hunspell:	the spell checking libraries and apps')
source=('http://ftp.services.openoffice.org/pub/OpenOffice.org/contrib/dictionaries/et_EE.zip')
md5sums=('2a1e97d61132c537aa03df4d0fee9b89')

package() {
	cd "${srcdir}"
	install -dm755 ${pkgdir}/usr/share/hunspell
	install -m644 et_EE.dic ${pkgdir}/usr/share/hunspell/
	install -m644 et_EE.aff ${pkgdir}/usr/share/hunspell/

	# the symlinks
	install -dm755 ${pkgdir}/usr/share/myspell/dicts
	pushd ${pkgdir}/usr/share/myspell/dicts
	for file in ${pkgdir}/usr/share/hunspell/*; do
		ln -sv /usr/share/hunspell/$(basename ${file}) .
	done
	popd

	# docs
	install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
	install -m644 README_et_EE.txt $pkgdir/usr/share/doc/${pkgname}/README_et.txt
}
