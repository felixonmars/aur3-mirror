# Contributor: gareth_c
# Maintainer: Ner0

pkgname=cinnamon-applet-vbox-launcher
pkgver=0.2
pkgrel=1
pkgdesc="Simple Cinnamon applet to launch Virtualbox virtual machines directly from the panel."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/25"
license=('GPL')
groups=('cinnamon-applets')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/applets/SNYV-R5SS-R4ZO.zip")
md5sums=('76de0a8e784cf0b9abc6c1710135b2cc')

package() {
  cd $pkgname
  find vboxlauncher\@adec/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/cinnamon/applets/{}" \;
}
