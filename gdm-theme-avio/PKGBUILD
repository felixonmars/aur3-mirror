# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=gdm-theme-avio
pkgver=0.9.2
pkgrel=1
pkgdesc="A hopefully good looking theme for GDM Greeter."
arch=(any)
url="http://www.gnome-look.org/content/show.php/Avio-GDM?content=37395"
license=('GPL')
depends=('gdm')
source=(http://www.uni-magdeburg.de/oelgarte/gdm/Avio-GDM-$pkgver.tar.gz)
md5sums=('787108b9c4d69434179935af270be0bf')

build() {
  mkdir -p $pkgdir/usr/share/gdm/themes/

  cp -R $srcdir/Avio-GDM/ $pkgdir/usr/share/gdm/themes/
}
