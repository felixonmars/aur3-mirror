# Maintainer: Jouke Witteveen <j.witteveen@gmail.com>

pkgname=netctl
pkgver=0.4
pkgrel=1
arch=(any)
pkgdesc="Network configuration and profile scripts"
url="http://projects.archlinux.org/netctl.git/"
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
conflicts=("netcfg")
provides=("netcfg")


source=("ftp://ftp.archlinux.org/other/community/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig})
md5sums=('2e802a93b4440b6a3098d640c2bc574e'
         '3e62f7b11ec635b0b86c9bbdb137627e')


package() {
  make -C "$srcdir/$pkgname-$pkgver" DESTDIR="$pkgdir" install

  # Shell Completion
  install -Dm644 "$srcdir/$pkgname-$pkgver/contrib/bash-completion" "$pkgdir/usr/share/bash-completion/completions/netctl"
  install -Dm644 "$srcdir/$pkgname-$pkgver/contrib/zsh-completion" "$pkgdir/usr/share/zsh/site-functions/_netctl"
}
