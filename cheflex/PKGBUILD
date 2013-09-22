# Maintainer: Ali H. Caliskan <ahc (at) selflex.org>

pkgname=cheflex
pkgver=1.0.4
pkgrel=1
pkgdesc="A simple yet flexible package manager."
arch=('i686' 'x86_64')
url='http://www.selflex.org/cheflex'
license=('GPL-3')
depends=('aria2' 'bash' 'fakeroot')
install=cheflex.install
source=("https://github.com/selflex/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('1cc8878ec4b0c3a19de0d1ec7c1c0163')

package() {
	cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}

	install -D -m755 cheflex.sh ${pkgdir}/usr/bin/cheflex
	install -D -m644 cheflex.rc ${pkgdir}/etc/cheflex

	mkdir -p ${pkgdir}/var/lib/cheflex/{grp,pkg,lst}
	chmod 775 ${pkgdir}/var/lib/cheflex/{grp,pkg}
}