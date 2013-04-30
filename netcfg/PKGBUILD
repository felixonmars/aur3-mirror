# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: Jouke Witteveen <j.witteveen@gmail.com>

pkgname=netcfg
pkgver=3.1
pkgrel=1
pkgdesc="Network configuration and profile scripts"
url="https://github.com/GNU-Pony/netcfg"
license=("BSD")
backup=(etc/iftab etc/conf.d/netcfg)
depends=("coreutils" "dhcpcd" "iproute2")
#makedepends=('asciidoc')  # The source tarball includes pre-built documentation.
optdepends=('dialog: for the menu based profile and wifi selectors'
            'wpa_supplicant: for wireless networking support'
            'ifplugd: for automatic wired connections through net-auto-wired'
            'wpa_actiond: for automatic wireless connections through net-auto-wireless'
            'wireless_tools: for interface renaming through net-rename'
            'ifenslave: for bond connections'
            'bridge-utils: for bridge connections'
           )
source=(https://github.com/GNU-Pony/netcfg/archive/${pkgver}.tar.gz)
arch=(any)
md5sums=('e2e0443f69a4e2379b2a3c5179534c9d')

package() {
  cd "$srcdir/netcfg-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/netcfg/LICENSE"

  # Shell Completion
  install -D -m644 contrib/bash-completion "$pkgdir/usr/share/bash-completion/completions/netcfg"
  install -D -m644 contrib/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_netcfg"

  # Compatibility
  ln -s netcfg.service "$pkgdir/usr/lib/systemd/system/net-profiles.service"
}

