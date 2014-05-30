# Maintainer : Tom Bu <tom.bu AT members.fsf.org>
# Contributer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=lostsky
pkgver=0.10.0
pkgrel=1
pkgdesc="Strategy RPG set in the Touhou universe"
arch=(any)
url="http://lostsky.featheredmelody.com/"
license=('BSD')
depends=('python2-pygame' 'python2-xdg')
options=(!emptydirs)
source=('https://bitbucket.org/featheredmelody/lost-sky-project-public/get/v0.10.0%20Final..tar.bz2' 'lostsky.desktop' 'lostsky.png' 'lostsky')
md5sums=('fbef503fd6950a9f5d52a734431a1a51'
         'af2c741d63dd9d4c32920befdfd51d27'
         '0c7493aad44dfd09dacca835ea6e3b6a'
		 '5669fdbbbed6b0591574bef9aa697319')

package() {
	cd "${srcdir}/featheredmelody-lost-sky-project-public-78b219018a12/Story of a Lost Sky"
	find ./ -iname "*.py" | xargs chmod a+x
	cd ${srcdir}
	mkdir -p ${pkgdir}/opt/
	cp -a "${srcdir}/featheredmelody-lost-sky-project-public-78b219018a12/Story of a Lost Sky" ${pkgdir}/opt/lostsky/
	install -Dm755 lostsky ${pkgdir}/usr/bin/lostsky
	install -Dm755 lostsky.desktop ${pkgdir}/usr/share/applications/lostsky.desktop
	install -Dm644 lostsky.png ${pkgdir}/usr/share/pixmaps/lostsky.png
}

