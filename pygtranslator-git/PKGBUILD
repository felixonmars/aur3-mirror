# Contributor: Skunnyk <skunnyk@archlinux.fr>

_pkgname=pygtranslator
pkgname=pygtranslator-git
pkgver=10.aaafb50
pkgrel=1
pkgdesc="GUI tool in python for google translate"
arch=(i686 x86_64)
url="https://github.com/xrado/pygtranslator"
license=('custom')
provides=
depends=('pygtk')
makedepends=('git')
source=(git://github.com/xrado/pygtranslator)
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	# Use standard directory for doc
	sed -i "s:/usr/doc:/usr/share/doc:" $_pkgname/setup.py
}

package() {
	cd $srcdir/$_pkgname

	python2 setup.py install --prefix=/usr --root="$pkgdir"
}
