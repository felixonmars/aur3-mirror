# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: crazyelf5

pkgname=gtk-theme-anewstart
pkgver=1.3
pkgrel=1
pkgdesc="A slick and clear GTK2/GTK3 theme"
arch=('any')
url="http://alecive.deviantart.com/art/A-New-Start-1-3-169100684"
license=('cc-by-nc-sa')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
source=('https://www.dropbox.com/s/dh5snytgvpo87ti/anewstart1.3.zip')
md5sums=('292ee0a1952e18d2c2c98e695a0ce7ad')


package() {
  cd ANewStart/1*

  find ANewStart/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
