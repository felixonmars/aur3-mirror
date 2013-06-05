#Contributor: muhas <muhas@mail.ru>
# Contributor: Shizeeg Unadequatov <shizeeque@gmail.com>

pkgname=fbless-git
pkgver=20120814
pkgrel=1
pkgdesc="Curses based FictionBook2 (fb2) viewer."
url="http://pybookreader.narod.ru/misc.html"
license=('GPL')
depends=('python2' 'ncurses')
makedepends=('git')
arch=('any')

source=('fbless::git+https://github.com/matimatik/fbless.git')
_gitname='fbless'
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	echo $(git log -1 --date=short | grep Date | sed 's|[^0-9]||g')
}

build() {
	cd "${srcdir}/${_gitname}"
	python2 setup.py build
}

package() {
	cd "${srcdir}/${_gitname}"
	python2 setup.py install --root="${pkgdir}"
	install -Dm644 README  "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
	install -Dm644 fblessrc.example "${pkgdir}/usr/share/doc/${pkgname}/fblessrc.example"

	find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
# vim: st=2:ts=2:et
