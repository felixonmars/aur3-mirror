#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: Army
# Contributor: James Rayner <james@archlinux.org> 

pkgname=netcfg-git
pkgver=3.1.511.6737a37
pkgrel=1
pkgdesc="Network configuration and profile scripts"
url="http://projects.archlinux.org/netcfg.git/"
license=('BSD')
arch=('any')
backup=('etc/iftab' 'etc/conf.d/netcfg')
depends=('dhcpcd' 'iproute2')
optdepends=('dialog: for the menu based profile and wifi selectors'
            'wpa_supplicant: for wireless networking support'
            'ifplugd: for automatic wired connections through rc.d/net-auto-wired'
            'wpa_actiond: for automatic wireless connections through rc.d/net-auto-wireless'
            'wireless_tools: for interface renaming through net-rename'
            'ifenslave: for bond connections'
            'bridge-utils: for bridge connections'
           )
makedepends=('git' 'asciidoc')
conflicts=('netcfg')
provides=('netcfg')
source=("$pkgname::git://projects.archlinux.org/netcfg.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/$pkgname

  echo "$(git describe).$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir"/$pkgname

  make DESTDIR="$pkgdir" install

  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/netcfg/LICENSE
  install -D -m644 contrib/bash-completion "$pkgdir"/etc/bash_completion.d/netcfg
  install -D -m644 contrib/zsh-completion "$pkgdir"/usr/share/zsh/site-functions/_netcfg

  find "$pkgdir" -type d -name '.git' -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
