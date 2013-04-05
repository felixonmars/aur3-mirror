# Maintainer: Frikilinux <frikilinux at gmail.com>

pkgname=gtk-theme-gnome-uncomplicated
pkgver=1.01
pkgrel=1
pkgdesc="A theme made with 'The text document' in mind"
arch=('any')
url="http://gnome-look.org/content/show.php/Uncomplicated?content=157986"
license=('GPL3')
depends=('gtk-engines' 'gtk-engine-murrine')
conflicts=()
replaces=()
options=('!strip')
source=("http://gnome-look.org/CONTENT/content-files/157986-Uncomplicated-${pkgver}.tar.gz")
install=gtk-theme-gnome-uncomplicated.install
sha256sums=('030dc0c827fafd36bcc4d89ec6548484f39f8eea6e26b15b00ac56afd2276bd0')

package() {
  find Uncomplicated -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
