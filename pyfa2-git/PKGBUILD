# Maintainer: Heine Laursen <zannvip at gmail dot com>

pkgname=pyfa2-git
pkgver=20110914
pkgrel=1
pkgdesc="Pyfa is a cross-platform desktop fitting application for EVE-Online"
url='http://www.evefit.org/Evefit'
#arch=('i686' 'x86_64')
arch=(any)
license=('GPL')
depends=('python2' 'wxpython' 'python2-sqlalchemy')
optdepends=('python2-matplotlib: For making graphs')
conflicts=('pyfa-git')
makedepends=('git')
source=('pyfa.desktop' 'pyfa.sh')
md5sums=('7e772d62cc20d9996a5aadc218adb6e9'
	'9d773a5dc2d704c8205590489d2d222e')

option=('nostrip')
_gitroot='git://www.evefit.org/pyfa.git'
_gitname='pyfit'

build() {
cd "$src"

if [ -d "$_gitname" ] ; then
	msg "Updating git repo..."
	cd $_gitname
	git pull origin
	msg "Updating Submodules"
	git submodule update
else
	git clone $_gitroot $_gitname
	cd $_gitname
	msg "Cloning submudules.."
	git submodule update --init
fi
}

package() {
	cd "$_gitname"
	install -d "${pkgdir}"/usr/bin
	install -d "${pkgdir}"/usr/share/pyfa
	install -d "${pkgdir}"/usr/share/pixmaps
	install -d "${pkgdir}"/usr/share/applications
	cp -R ./* "${pkgdir}"/usr/share/pyfa/
	install ./icons/pyfa.png "${pkgdir}"/usr/share/pixmaps/
	install -m755 "${srcdir}"/../pyfa.sh "${pkgdir}"/usr/bin
	install "${srcdir}"/../pyfa.desktop "${pkgdir}"/usr/share/applications/
	rm -Rf "${pkgdir}"/usr/share/pyfa/staticdata/.git
	rm -Rf "${pkgdir}"/usr/share/pyfa/eos/.git
	find ${pkgdir}/usr/share/pyfa -type d -exec python2 -m compileall {} \; || return 1
}
