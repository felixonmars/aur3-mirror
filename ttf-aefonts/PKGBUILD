# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=ttf-aefonts
pkgver=20071109
pkgrel=2
pkgdesc="Aenigma Fonts font archive"
arch=(any)
url=http://www.aenigmafonts.com
license=(freeware)
depends=(fontconfig xorg-font-utils)
install=ttf.install
source=(https://launchpad.net/~stephane-brunner/+archive/karmic/+files/ttf-aefonts_0.0.1-0ubuntu1~ppa0.tar.gz)
sha256sums=('ed0f11372c4cc9f7e39e556b16ccef12f2af61c9aa0cabfe933c9c2c7511ea53')
sha512sums=('32d3b88a8a359560a8e042157d9ae2ea230960f4695100a8a12fc36f36eaed797446f6213c6a689a094ec2168a3b43fa24050f00cc3ff6b8d7e1254134d5e754')

package() {
    cd $pkgname/
    install -d "$pkgdir"/usr/share/fonts/TTF/
    install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF/
}
