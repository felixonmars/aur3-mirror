# Maintainer: Sebastian J.B. "gonX" Jensen <gonx@overclocked.net>
# Based on networkmanager-dispatcher-chrony by Frederik "Freso" S. Olesen

pkgname=netctl-dispatcher-chrony
pkgver=1.0
pkgrel=1
pkgdesc="Netctl Dispatcher Script"
arch=(any)
license=('GPL')
url="https://github.com/joukewitteveen/netctl"
depends=('netctl' 'chrony')
install='netctl-dispatcher-chrony.install'
source=('chrony-up.sh' 'chrony-down.sh' 'chrony-netctl.conf')
sha256sums=('0ee1dae2bba7ed34e9b16b6846cce4eca26ef7d5ce4d991f226cbf54d1ca546f'
			'7a78b22c9771d79aef61899cdd2ef21ea43203385e0a1d8852dc660ccf464c9a'
			'f6f40de9d88903a24973ec8b98faab6cc12672e829bda8b305679896b2270948')

package() {
	install -Dm744 "${srcdir}/chrony-up.sh" "${pkgdir}/usr/share/netctl-dispatcher-chrony/chrony-up.sh"
	install -Dm744 "${srcdir}/chrony-down.sh" "${pkgdir}/usr/share/netctl-dispatcher-chrony/chrony-down.sh"
	install -Dm644 "${srcdir}/chrony-netctl.conf" "${pkgdir}/etc/netctl/chrony-dispatcher/chrony-netctl.conf"
}
			
