# Maintainer: Frikilinux <frikilinux at gmail.com>

pkgname=gtk-theme-uncomplicated
pkgver=1.04
pkgrel=2
pkgdesc="A theme made with 'The text document' in mind"
arch=('any')
url="http://gnome-look.org/content/show.php/Uncomplicated?content=157986"
license=('GPL3')
depends=('gtk-engines' 'gtk-engine-murrine')
conflicts=('gtk-theme-gnome-uncomplicated')
replaces=()
options=('!strip')
source=("https://dl.dropboxusercontent.com/u/80497678/Uncomplicated-${pkgver}.tar.gz")
install=gtk-theme-uncomplicated.install
sha256sums=('7c0079bd77ed6657aa5c6961a1ae4211872fc72ac1a72809a54a37905155a664')

package() {
  find Uncomplicated* -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
