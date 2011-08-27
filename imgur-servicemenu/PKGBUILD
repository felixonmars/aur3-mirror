# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jachym Barvinek <jachymb@gmail.com>
pkgname=imgur-servicemenu
pkgver=0.9
pkgrel=3
epoch=
pkgdesc="Service menu for KDE 4.x for uploading images to imgur"
arch=('any')
url="http://kde-apps.org/content/show.php/?content=136616"
license=('GPL')
groups=()
depends=(kdebase-kdialog desktop-file-utils)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=imgur-servicemenu.install
changelog=
source=("http://kde-apps.org/CONTENT/content-files/136616-${pkgname}_$pkgver.tar.gz" "imgur-upload.desktop")
noextract=()
md5sums=('063fd0b48bc752270c29d90d58fd74fa'
         '1e926139b23852b4773506a1b4419a01')

build() {
  cd "$srcdir/${pkgname}_$pkgver"
  sed -i 's/imgur_history/.imgur_history/g' imgur
}

package() {
  mkdir -p "$pkgdir/usr/share/kde4/services/"
  mkdir -p "$pkgdir/usr/share/pixmaps/" 
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/share/applications"
  cd "$srcdir/${pkgname}_$pkgver"
  install -m 644 imgur.desktop "$pkgdir/usr/share/kde4/services/"
  install -m 644 imgur.png "$pkgdir/usr/share/pixmaps/"
  install -m 755 imgur "$pkgdir/usr/bin/"
  cd $startdir
  install -m 644 imgur-upload.desktop "$pkgdir/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
