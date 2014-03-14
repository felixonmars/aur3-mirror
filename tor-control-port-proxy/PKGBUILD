# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=tor-control-port-proxy
pkgver=0.2
pkgrel=1
pkgdesc="Whitelisting Tor control port proxy written in Python"
arch=('any')
url="https://github.com/mutantmonkey/tor-control-port-proxy"
license=('GPL')
depends=('python' 'stem')
options=(!emptydirs)
source=('tor-control-port-proxy' 'tor-control-port-proxy.service')
sha256sums=('224c51d07e5393525a05cf11384b775dcb654469a6bdf6c6c5a06375c656c124'
            'eda5f0f43c9d2c8956743ba6485bb50fdb307af9941634902385214ecda14ce4')

package() {
  install -Dm755 tor-control-port-proxy \
    "${pkgdir}/usr/bin/tor-control-port-proxy"
  install -Dm644 tor-control-port-proxy.service \
    "${pkgdir}/usr/lib/systemd/system/tor-control-port-proxy.service"
}

# vim:set ts=2 sw=2 et:
