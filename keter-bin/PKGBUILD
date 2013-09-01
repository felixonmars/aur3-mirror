# Maintainer: Samuli Thomasson <samuli.thomasson@paivola.fi>

pkgname=keter-bin
pkgver=0.4.0
pkgrel=3
pkgdesc="Precompiled version of keter, the yesod deployment manager."
arch=('x86_64')
url="http://github.com/snoyberg/keter"
license=('MIT')
depends=()
makedepends=()
provides=()
conflicts=()
source=("http://functor.paivola.fi/dump/keter-standalone-${arch}-${pkgver}-${pkgrel}.tar.gz")
md5sums=('a3ced8c5d8debf5b97389ae2edef8b95')

package() {
   cd ${srcdir}

   mkdir -p "$pkgdir/srv/keter"

   install -Dm755 keter "$pkgdir/usr/bin/keter"
   install -Dm644 keter.service "$pkgdir/usr/lib/systemd/system/keter.service"
   install -Dm644 LICENSE "$pkgdir/usr/share/licenses/keter/LICENSE"
   install -Dm644 keter.yaml "$pkgdir/etc/keter.yaml"
}
