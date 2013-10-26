# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=networkmanager-fake
pkgdesc="A fake networkmanager package (to bypass dependency)"
url='http://lara.craft.net.br'

pkgver=1
pkgrel=2
arch=('any')
license=('GPL')

conflicts=(networkmanager
           wpa_supplicant
           modemmanager)
           
provides=('networkmanager=fake'
          'wpa_supplicant=fake'
          'modemmanager=fake')

package() {
	true
}
