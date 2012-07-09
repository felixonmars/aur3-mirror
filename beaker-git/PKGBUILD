# PKGBUILD created by: Gris Ge <cnfourt@gmail.com>
# PKGBUILD maintained by: Wang Chao <wangchao19890207@gmail.com>

pkgname="beaker-git"
pkgver=20120709
pkgrel=1
pkgdesc="Common files for beaker and client tools for beaker job maintenance."
arch=('any')
makedepends=('python2' 'krb5' 'python2-distribute' 'python-kobo' 'python2-krbv' 'python2-lxml')
url=("https://fedorahosted.org/beaker")
license=('GPL')
depends=('python2' 'krb5' 'python2-distribute' 'python-kobo' 'python2-krbv' 'python2-lxml' 'python2-sphinx')
source=("arch-python2.patch")
md5sums=('004d7bbf3ccdd129309286b104bfe1de')
_gitroot='git://git.fedorahosted.org/beaker.git'
_gitname='beaker'

build() {
	cd ${srcdir}
	msg "Connecting to GIT server..."
	if [ -d ${_gitname} ]; then
		cd ${_gitname}
		git pull origin
	else
		git clone ${_gitroot}
		cd ${_gitname}
	fi
	msg "GIT checkout done or server timeout"

	patch -p1 -i ${srcdir}/arch-python2.patch
	make clean || return $?
	make DESTDIR=${pkgdir} build || return $?
}

package() {
	cd ${srcdir}/${_gitname}
	#make SUBDIRS="Common Client" PY_PREFIX="/usr" DESTDIR=${pkgdir} install || return $?
	make DESTDIR=${pkgdir} install || return $?
}
