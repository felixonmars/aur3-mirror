pkgname=touchpadtoggle
pkgver=1
pkgrel=1
url=('https://github.com/thriqon/touchpadtoggle')
pkgdesc="toggles touchpad using synclient"
arch=('any')
license=('None')
depends=('xf86-input-synaptics' 'zsh')
source=('touchpadtoggle')
md5sums=('c2c0c2b64bba588dfa1bd98a3b212af6')

package() {
  install -d $pkgdir/usr/bin
  install -D -t $pkgdir/usr/bin touchpadtoggle
}

# vim:set ts=2 sw=2 et:
