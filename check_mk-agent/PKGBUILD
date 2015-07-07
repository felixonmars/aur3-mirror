# Maintainer: Christoph Gebhardt <cg-aur@zknt.org>
# Contributer: (swish) Divan Santana <divan@santanas.co.za>

pkgname=check_mk-agent
pkgver=1.2.6p7
pkgrel=1
pkgdesc="The check-mk's Agent"
arch=('any')
url="http://mathias-kettner.com/check_mk.html"
license=('GPL2')
depends=('xinetd' 'bash')
makedepends=('rpmextract')
source=(https://mathias-kettner.de/support/1.2.6p7/check-mk-raw-1.2.6p7-el6-34.x86_64.rpm)
sha256sums=('abb2b9dedbbb40777ac02988d257e4609c4f9f0daacc9634c841351aae06f6cc')
 
build() {
cd $srcdir
}

package() {
  install -Dm644 "$srcdir"/opt/omd/versions/${pkgver}.cre/share/check_mk/agents/xinetd.conf "$pkgdir"/etc/xinetd.d/check_mk
  install -Dm755 "$srcdir"/opt/omd/versions/${pkgver}.cre/share/check_mk/agents/check_mk_agent.linux "$pkgdir"/usr/bin/check_mk_agent
  install -Dm755 "$srcdir"/opt/omd/versions/${pkgver}.cre/share/doc/check_mk/COPYING "$pkgdir"/usr/share/doc/check_mk_agent/COPYING
  install -Dm755 "$srcdir"/opt/omd/versions/${pkgver}.cre/share/doc/check_mk/ChangeLog "$pkgdir"/usr/share/doc/check_mk_agent/ChangeLog
  install -Dm755 "$srcdir"/opt/omd/versions/${pkgver}.cre/share/doc/check_mk/AUTHORS "$pkgdir"/usr/share/doc/check_mk_agent/AUTHORS
  mkdir -p "$pkgdir"/usr/lib/check_mk_agent
  mkdir "$pkgdir"/usr/lib/check_mk_agent/local
  mkdir "$pkgdir"/usr/lib/check_mk_agent/plugins
}
