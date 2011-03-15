# Contributor: Mark Harviston infinull@gmail.com
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# based on: http://pastebin.com/deqgqjJe
pkgname=jslint-git
pkgver=20110314
pkgrel=1
pkgdesc="The Javascript Code Quality Tool"
arch=('any')
url="http://jslint.com"
license=('(C)2002 Douglas Crockford')
depends=('rhino')
makedepends=('git')
author='Douglas Crockford'
source=('jslint.sh')
md5sums=('0ef99d04b8dbef60de9004d3448e3000')

_gitroot="https://github.com/douglascrockford/JSLint.git"
_gitname=jslint


build() {
	cd "${srcdir}"
		msg "Connecting to GIT server...."
	if [ -d ${_gitname} ] ; then
	#cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi

		cd ${_gitname}
		git checkout d98f75307977f91aa25d4567e8ad1bdc043abae5
	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	install -m 644 -D "$srcdir/jslint/rhino.js" "$pkgdir/usr/share/jslint/rhino.js"
	install -m 644 -D "$srcdir/jslint/fulljslint.js" "$pkgdir/usr/share/jslint/fulljslint.js"
	install -D "$srcdir/jslint.sh" "$pkgdir/usr/bin/jslint"
}