# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=dhard
pkgver=1.1
pkgrel=2
pkgdesc="DHard helps buggy programs run correctly."
url="http://www.diehard-software.org"
arch=('i686')
license=('custom')
depends=('gcc-libs' 'sh')
source=(http://www.cs.umass.edu/~emery/diehard/download/${pkgver}/diehard-${pkgver}.tar.gz \
        'diehard.profile' 'LICENSE')
md5sums=('09acd8e825ff7544759238a89300506f'\
         'b32899da9e37a6de898e65c6d007b8ee'\
         '108bedb75ae0cb7a6cb41f29b845156f')
build() {
	cd ${srcdir}/diehard-${pkgver}/src
	make linux || return 1
	install -Dm644 libdiehard.so ${pkgdir}/usr/lib/diehard/libdiehard.so
	install -Dm755 ${srcdir}/diehard.profile ${pkgdir}/etc/profile.d/diehard.sh
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
