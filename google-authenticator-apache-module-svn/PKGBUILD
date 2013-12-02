# Maintainer: Michael Spradling <mike@mspradling.com>

pkgname=google-authenticator-apache-module-svn
_pkgname=google-authenticator-apache-module
pkgver=0.r22
pkgrel=1
pkgdesc="Google Authenticator Aapche module"
arch=('i686' 'x86_64')
url="https://code.google.com/p/google-authenticator-apache-module/"
license=('apache')
depends=('apache')
makedepends=('subversion' 'apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=google-authenticator-apache-module.install
source=("${_pkgname}::svn+http://google-authenticator-apache-module.googlecode.com/svn/trunk")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	local ver="$(svnversion)"
	printf "0.r%s" "${ver//[[:alpha:]]}"
}

build() {
	cd "$srcdir/${_pkgname}"
	make || return 1
}

package() {
	cd "$srcdir/${_pkgname}"
	install -D -m755 .libs/mod_authn_google.so $pkgdir/usr/lib/httpd/modules/mod_authn_google_authenticator.so
}
