# Maintainer: DavidK <david_king at softhome dot net>
# Contributor:  mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-trivial-garbage-git
_clname=trivial-garbage   # used in CL scope, not package scope
pkgver=0_18.r18.g2721d36
pkgrel=2
pkgdesc="Several portable Common Lisp extensions"
arch=('any')
url="http://common-lisp.net/project/trivial-garbage/"
license=('custom')
depends=('common-lisp')
makedepends=('git')
optdepends=('cl-rt: For the test suite')
provides=('cl-trivial-garbage')
install=cl-trivial-garbage.install
source=("$pkgname"::'git+https://github.com/trivial-garbage/trivial-garbage.git')
md5sums=('SKIP')
options=(docs)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'

}

package() {
        cd "$srcdir/$pkgname"
        sed -i "s/:rtest/:rt/g" trivial-garbage.asd

	install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}
	install -d "${pkgdir}"/usr/share/common-lisp/systems
        install -d "${pkgdir}"/usr/share/licenses/${pkgname}

	install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
		"${srcdir}/$pkgname"/*.lisp
	install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
		"${srcdir}/$pkgname"/*.asd
        install -m 644 -T README "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

	cd "${pkgdir}"/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .
}
