# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=dropbox-share
pkgver=0.5.5
pkgrel=4
pkgdesc="A Nautilus script for easily sharing files using Dropbox"
arch=(any)
url=https://launchpad.net/$pkgname
license=(GPL3)
depends=(dropbox-cli nautilus-dropbox xclip)
install=$pkgname.install
source=(https://launchpad.net/~nilarimogard/+archive/webupd8/+files/${pkgname}_$pkgver-1~webupd8~oneiric.tar.gz)
sha256sums=('cd029f98bd5ae7bf4d612b9bdc7932af6f3a4cacde184fb778bbefd899af01fa')
sha512sums=('2ac6005ae1dee27e620a6ea7ef2fbac1c98f6357dd4899180fc1d22c0e280148041376d63fbbb35a1cd240cf94205557f8068211527d0bd73509a375da4af225')

build() {
        cd "$srcdir"/$pkgname/
        sed -i 's:^#!/usr/bin/env python$:&2:g' bin/dropbox-index
        install -Dm755 bin/dropbox-index "$pkgdir"/usr/bin/dropbox-index
        install -Dm755 "Dropbox Share" "$pkgdir"/usr/share/nautilus-scripts/$pkgname
        install -Dm755 "Dropbox Unshare" "$pkgdir"/usr/share/nautilus-scripts/dropbox-unshare
}
