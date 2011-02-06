# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=pyfloppy
pkgver=1.6
pkgrel=4
pkgdesc="Graphical floppy disk formatting tool written in Python/Tkinter"
arch=('any')
url="http://klappnase.bubble.org/pyfloppy/"
license=('GPL')
depends=('python' 'tk' 'util-linux' 'e2fsprogs' 'dosfstools')
source=(http://klappnase.bubble.org/download/$pkgname-$pkgver.tar.bz2 \
  $pkgname.desktop)
md5sums=('920642c237d39548e438a4598acc349d'
         '7e87a981b5224cca5a5e642f047d359a')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  # install program
  install -Dm755 $pkgname.py "$pkgdir"/usr/bin/$pkgname
  install -Dm644 doc/ChangeLog "$pkgdir"/usr/share/doc/$pkgname/ChangeLog
  install -Dm644 doc/README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 locale/de.gmo "$pkgdir"/usr/share/locale/de/LC_MESSAGES/$pkgname.mo
  install -Dm644 locale/es.gmo "$pkgdir"/usr/share/locale/es/LC_MESSAGES/$pkgname.mo
  # install desktop file
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
