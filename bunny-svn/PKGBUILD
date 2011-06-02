# Contributor: fnord0 < fnord0 AT riseup DOT net >

pkgname=bunny-svn
pkgver=20
pkgrel=1
pkgdesc="instrumented C code security fuzzer"
arch=('any')
url="http://code.google.com/p/bunny-the-fuzzer/"
license=('APACHE')
makedepends=('subversion')
_svnmod="bunny"
_svntrunk="http://bunny-the-fuzzer.googlecode.com/svn/trunk/"
provides=('bunny')

build() {
	# fetch latest svn build
	if [ -d ${srcdir}/.svn ]; then
	  msg 'Updating bunny SVN...'
	  svn up ${srcdir} || return 1
	else
	  msg 'Checking out bunny SVN...'
	  svn co ${_svntrunk} ${srcdir} || return 1
	fi
	msg "bunny SVN checkout complete, or the server timed out"

	mkdir -p ${pkgdir}/usr/{bin,src} || return 1
	cd ${pkgdir}/usr/src
	svn export ${srcdir} ${_svnmod} || return 1
	cd ${pkgdir}/usr/src/${_svnmod}
	mv bunny/* . || return 1
	rm -rf bunny || return 1
	make || return 1
}
# vim:syntax=sh
