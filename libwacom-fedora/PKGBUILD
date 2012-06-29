# Maintainer: Lars Jacob <lars+aur@jaclar.net>

pkgname=libwacom-fedora
pkgver=0.5
pkgrel=1
pkgdesc="Library to identify Wacom tablets and their features (with fedora patches so gsd won't crash with a serial touchscreen)"
arch=('x86_64' 'i686')
depends=('glib2' 'udev')
provides=('libwacom')
conflicts=('libwacom')
license=('MIT')
options=('!libtool')
source=(http://downloads.sourceforge.net/project/linuxwacom/libwacom/libwacom-$pkgver.tar.bz2
  '0001-data-add-generic-eraser-to-Bamboo-Pen-Touch.patch'
  '0001-lib-fix-an-error-message.patch'
  '0001-lib-Fix-generic-stylus-missing-an-eraser.patch'
  '0001-lib-serial-devices-may-end-up-with-a-NULL-product_st.patch'
  '0001-tools-add-missing-linker-flags-for-list-local-device.patch')
sha256sums=('62e38476305ba8c998071e77feaa4ec7b8a5ab08b6b483c35f1a4dca8a6b7ede'
            '21dfff69b25e35169e6b9d56f1e98d5dc5f839189a52e3fb3655683c2a0cb972'
            '2c2338cf107ae1b6e2f4db4b2b8bfbcabebc2b74f0653f1382170a4b771963d0'
            '43b22a2685d7afcc34627de9ba75b66db411f9b4e923aa44265c376574cd6365'
            '61138ff32719e2c5c84f65f80f7343f21c43523296bbc31c2af181007df3cde3'
            'fd7fcaabc06e4ef78b2be37969fddc454ea279b1f38fcce991033e3c807a7fd8')
url="http://sourceforge.net/apps/mediawiki/linuxwacom/index.php?title=Libwacom"

build() {
  cd $pkgname-$pkgver
  patch -p1 < ../0001-data-add-generic-eraser-to-Bamboo-Pen-Touch.patch
  patch -p1 < ../0001-lib-fix-an-error-message.patch
  patch -p1 < ../0001-lib-Fix-generic-stylus-missing-an-eraser.patch
  patch -p1 < ../0001-lib-serial-devices-may-end-up-with-a-NULL-product_st.patch
  patch -p1 < ../0001-tools-add-missing-linker-flags-for-list-local-device.patch

  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
