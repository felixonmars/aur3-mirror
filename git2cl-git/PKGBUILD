# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=git2cl-git
pkgver=20081110
pkgrel=1
pkgdesc="Convert git logs to GNU ChangeLog format"
url="http://josefsson.org/git2cl/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('git' 'perl')
makedepends=('git')
conflicts=('git2cl')
provides=('git2cl')
source=()
md5sums=()

_gitroot="git://git.savannah.nongnu.org/git2cl.git"
_gitname="git2cl"

build() {
	cd ${srcdir}
	msg "Connecting to repo.or.cz Git server."

	if [ -d ${srcdir}/$_gitname ] ; then
		cd $_gitname && git pull origin || return 1
		msg "The local files have been updated."
	else
		git clone $_gitroot || return 1
	fi

	msg "Git checkout done."

	mkdir -p ${pkgdir}/usr/{bin/,share/doc/${pkgname/\-git/}} || return 1
	install -m755 ${srcdir}/${_gitname}/git2cl ${pkgdir}/usr/bin || return 1
	install -m644 ${srcdir}/${_gitname}/README* ${pkgdir}/usr/share/doc/${pkgname/\-git/} || return 1
}
