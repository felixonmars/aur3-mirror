# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=xfce4-shining-reprise-icon-theme
pkgver=1
pkgrel=4
pkgdesc="Shining Reprise icon theme for XFCE"
arch=('any')
url="http://xfce-look.org/content/show.php/Shining+Reprise?content=123497"
license=('GPL')
source=('https://www.dropbox.com/s/89njrzuikocv76h/shining-reprise_104.tar.gz')
md5sums=('9a20ae0c225ed8d7ad9c8d935b658de2')

package() {
  mkdir -p "$pkgdir/usr/share/icons"
  cd $srcdir/
  mv "Shining Reprise" Shining_Reprise
  chmod -R 655 Shining_Reprise
  cp -R $srcdir/Shining_Reprise "$pkgdir/usr/share/icons"
}

