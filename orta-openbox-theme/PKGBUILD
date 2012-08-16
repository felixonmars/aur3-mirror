# Maintainer: Ner0

pkgname=orta-openbox-theme
pkgver=1.0
pkgrel=1
pkgdesc="Openbox theme matching the Orta GTK theme"
arch=('any')
url="http://box-look.org/content/show.php?content=142451"
license=('GPL')
depends=('openbox')
source=("http://box-look.org/CONTENT/content-files/142451-Orta_openbox.tar.gz")
md5sums=('185a191ac509e1782c721cfe639c65e9')

package() {
  find Orta/ -type f -not -name *~ -exec install -Dm644 "{}" "$pkgdir/usr/share/themes/{}" \;
}
