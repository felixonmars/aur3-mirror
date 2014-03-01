pkgname=kde-servicemenu-imgur-no-klipper
pkgver=0.9
pkgrel=2
pkgdesc="Service menu for KDE for uploading images to imgur"
arch=('any')
url="http://kde-apps.org/content/show.php/?content=136616"
license=('GPL')
depends=('kdebase-workspace' 'kdebase-runtime')
conflicts=('imgur-servicemenu')
replaces=('imgur-servicemenu')
install=kde-servicemenus-imgur.install
source=("http://kde-apps.org/CONTENT/content-files/136616-imgur-servicemenu_$pkgver.tar.gz"
	'imgur-upload.desktop'
	'remove-klipper.patch')
md5sums=('063fd0b48bc752270c29d90d58fd74fa'
         '1e926139b23852b4773506a1b4419a01'
         '8f07465d086001ed2a88460cf8aa5bb6')

build() {
  cd imgur-servicemenu_$pkgver
  sed -i 's/imgur_history/.imgur_history/g' imgur
  patch -p0 -i $srcdir/remove-klipper.patch
}

package() {
  cd imgur-servicemenu_$pkgver
  
  install -d "${pkgdir}"/usr/{bin,share/{kde4/services,pixmaps,applications}}
  install -m 644 imgur.desktop "$pkgdir/usr/share/kde4/services/"
  install -m 644 imgur.png "$pkgdir/usr/share/pixmaps/"
  install -m 755 imgur "$pkgdir/usr/bin/"
  install -m 644 "${srcdir}"/imgur-upload.desktop "$pkgdir/usr/share/applications"
}

