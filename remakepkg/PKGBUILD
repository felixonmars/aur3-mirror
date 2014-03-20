# Maintainer: Deci Aria <deciare@isisview.org>

pkgname=remakepkg
pkgver=1.0.1
pkgrel=1
pkgdesc="Converts an alterady-installed package back into an installable archive"
arch=('any')
license=('GPL')
url="https://github.com/deciare/remakepkg"
depends=('bash')
source=('remakepkg')
md5sums=('e6bad77ccb9939eb6590455ee6c30793')

package() {
	install -D "${srcdir}/remakepkg" "${pkgdir}/usr/bin/remakepkg"
}
