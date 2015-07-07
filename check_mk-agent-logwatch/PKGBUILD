# Maintainer: Christoph Gebhardt <cg-aur@zknt.org>
# Contributor: (swish) Divan Santana <divan@santanas.co.za>

pkgname=check_mk-agent-logwatch
pkgver=1.2.6p7
pkgrel=1
pkgdesc="Logwatch-Plugin for check_mk agent"
arch=('any')
url="http://mathias-kettner.com/check_mk.html"
license=('GPL2')
depends=('check_mk-agent' 'python')
makedepends=('rpmextract')
source=(https://mathias-kettner.de/support/1.2.6p7/check-mk-raw-1.2.6p7-el6-34.x86_64.rpm)
sha256sums=('abb2b9dedbbb40777ac02988d257e4609c4f9f0daacc9634c841351aae06f6cc')

build() {
        cd $srcdir
}

package() {
  install -Dm644 "$srcdir"/opt/omd/versions/${pkgver}.cre/share/check_mk/agents/cfg_examples/logwatch.cfg "$pkgdir"/etc/check_mk/logwatch.cfg
  install -Dm755 "$srcdir"/opt/omd/versions/${pkgver}.cre/share/check_mk/agents/plugins/mk_logwatch "$pkgdir"/usr/lib/check_mk_agent/plugins/mk_logwatch
}
