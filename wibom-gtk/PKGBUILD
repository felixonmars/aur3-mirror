# Maintainer: yugrotavele <yugrotavele at archlinux dot us>

pkgname=wibom-gtk
pkgver=0.12
pkgrel=1
pkgdesc="Wine bottle manager"
arch=('any')
url="http://wibom.sourceforge.net/"
license=('BSD')
depends=('gtk2' 'hicolor-icon-theme' 'ruby' 'ruby-gettext' 'ruby-gtk2' 'trash-cli' 'wine')
optdepends=('winetricks' 'xdg-utils' 'zenity')
install="$pkgname.install"
source=($pkgname-$pkgver-1.tar.bz2::http://sourceforge.net/projects/wibom/files/Tarballs/$pkgname-$pkgver-1.tar.bz2/download)
md5sums=('71b83912d606230bf25676ebf690f62d')

build() {
  cd "$srcdir/usr/bin"
  sed -i 's/©/c/g' wibom-gtk
  sed -i 's/č/c/g' wibom-gtk
  sed -i 's/á/a/g' wibom-gtk
  sed -n '/Copyright ©/,/SUCH DAMAGE\./p' wibom > LICENSE
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm LICENSE
}

package() {
  cp "$srcdir/usr" "$pkgdir" -r
}
