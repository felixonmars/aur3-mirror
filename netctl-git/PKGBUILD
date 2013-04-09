# Maintainer: Jouke Witteveen <j.witteveen@gmail.com>

pkgname=netctl-git
_pkgname=netctl
pkgver=0.8.3.g9ff7256
pkgver() {
    cd "$srcdir/netctl"
    git describe | sed 's/-/./g'
}
pkgrel=2
pkgdesc="Network configuration and profile scripts"
url="https://projects.archlinux.org/netctl.git"
license=("GPL")
depends=("coreutils" "iproute2" "openresolv")
makedepends=('asciidoc')
optdepends=('dialog: for the menu based wifi assistant'
            'dhclient: for DHCP support, or use dhcpcd'
            'dhcpcd: for DHCP support, or use dhclient'
            'wpa_supplicant: for wireless networking support'
            'ifplugd: for automatic wired connections through netctl-ifplugd'
            'wpa_actiond: for automatic wireless connections through netctl-auto'
            'ifenslave: for bond connections'
            'bridge-utils: for bridge connections'
            )
conflicts=('netcfg' 'netctl')
provides=('netcfg' 'netctl')
epoch=1

source=("$_pkgname::git://projects.archlinux.org/netctl.git")
md5sums=('SKIP')
arch=(any)

package() {
  make -C "$_pkgname" DESTDIR="$pkgdir" install

  # Shell Completion
  install -D -m644 "$_pkgname/contrib/bash-completion" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -D -m644 "$_pkgname/contrib/zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
