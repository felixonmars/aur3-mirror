# Maintainer: Johannes Dewender  arch at JonnyJD dot net
_pkgname=cov-analysis
pkgname=cov-analysis-bin
pkgver=6.5.1
pkgrel=1
pkgdesc="Coverity Scan Self-Build"
arch=('x86_64' 'i686')
url="https://scan.coverity.com/download"
license=('custom: non-free')
optdepends=()
provides=("cov-analysis=$pkgver")
conflicts=('cov-analysis')
options=()
#CARCH=i686
if [ "${CARCH}" = 'x86_64' ]; then
	_arch='linux64'
	_arch2='linux64'
	md5sums=('d0a64fe2f4520786f2703d03ac3e7c4f')
	depends=('sh' 'java-environment' 'lib32-glibc')
elif [ "${CARCH}" = 'i686' ]; then
	_arch='linux32'
	_arch2='linux'
	md5sums=('9267960fcc08e8f468330862eea2f993')
	depends=('sh' 'java-environment')
fi
source=(https://scan.coverity.com/build_tool/$_pkgname-$_arch-$pkgver.tar.gz)

package() {
	cd "$srcdir/$_pkgname-$_arch2-$pkgver"
	mkdir -p $pkgdir/opt/$_pkgname
	cp -r * $pkgdir/opt/$_pkgname/
}
