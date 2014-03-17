# Maintainer: Vincent Ambo <tazjin@gmail.com>
pkgname=thinkpad-t440s-brightness-keys
pkgver=1.0
pkgrel=1
pkgdesc="Fixes brightness jumping with T440s brightness keys"
arch=('any')
license=('GPL')
url="https://bitbucket.org/tazjin/t440s-pkgs/"
source=('https://gist.github.com/tazjin/8888928/raw/84dc7ef12d3af90ce3c6135724ad8c5d346b5737/t440s-brightness.conf')
md5sums=('2b766c1bdbfbe6b9903ac2f695cbb157')

package() {
	cd "$srcdir"
        install -d "${pkgdir}/etc/tmpfiles.d"
        install -m644 t440s-brightness.conf "${pkgdir}/etc/tmpfiles.d"
}
