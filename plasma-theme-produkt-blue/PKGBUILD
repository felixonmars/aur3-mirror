# Maintainer: danyf90 <daniele.formichelli@gmail.com>

pkgname=plasma-theme-produkt-blue
_themename=ProduktBlue
pkgver=0.1
pkgrel=1
pkgdesc="A textured plasma theme for Plasma-KDE"
arch=('any')
license=('GPL')
url="http://kde-look.org/content/show.php?content=124213"
depends=('kdebase-workspace')
source=("http://kde-look.org/CONTENT/content-files/162459-$_themename.zip")
sha512sums='e9a6588c29747d9a5a6235806c8c30ebf7efc11379bd7d06bc2cfefaa499409747db69024b84b2ca74c595530dfac167cebc16e9edd62f3822e2da9952df44c9'

package() {
  mkdir -p $pkgdir/usr/share/apps/desktoptheme
  mv $_themename $pkgdir/usr/share/apps/desktoptheme
  chmod 755 -R $pkgdir/usr/share/apps/desktoptheme/$_themename
}