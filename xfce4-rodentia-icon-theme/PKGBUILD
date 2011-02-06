
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=xfce4-rodentia-icon-theme
pkgver=1
pkgrel=1
pkgdesc="Rodentia icon theme for XFCE"
arch=('any')
url="http://browse.deviantart.com/?qh=&section=&global=1&q=rodentia#/d2h9jbw"
license=('GPL')
source=('http://fc06.deviantart.net/fs70/f/2010/031/1/1/Rodentia_by_sixsixfive.7z')
md5sums=('996782de1ed694a5f2f9b781ab237fcb')
makedepends=('p7zip')

build() {
  mkdir -p "$pkgdir/usr/share/icons"
  cd $srcdir/
  7z x Rodentia_by_sixsixfive.7z
  cp -R $srcdir/Rodentia "$pkgdir/usr/share/icons"
}
