# Maintainer: Jürn Brodersen <juern.brodersen@googlemail.com>

pkgname=scanastudio
pkgver=2.305.011
pkgrel=1

pkgdesc="Software to interface with Ikalogic’s logic analyzer devices (like Scanalogic-2)"

arch=('i686' 'x86_64')

url="http://www.ikalogic.com"
license=('unknown')

depends=('qtwebkit' 'shared-mime-info' 'gstreamer0.10-base' 'libpng12' 'libudev0' 'libusb')

install='scanastudio.install'

if test "$CARCH" == x86_64; then
  _filename=scanastudio_linux_64
  md5sums=('7b0fa7c0d1682973cd1f35e5c3fe4785')
elif test "$CARCH" == i686; then
  _filename=scanastudio_linux_32
  md5sums=('918956786eec9446b621a81c4539fe69')
fi
source=("http://ikalogic.com/scanastudio2/$_filename.zip")


prepare() {
  echo "Exec=/usr/bin/ikalogic/scanastudio/scanastudio" >> $_filename/mime/scanastudio.desktop
  sed -i 's/scanastudio.png/scanastudio/g' $_filename/mime/scanastudio.desktop
}

package() {
  cd "$srcdir/$_filename"

  mkdir -p "$pkgdir/usr/lib/ikalogic"
  cp -r lib/* "$pkgdir/usr/lib/ikalogic"

  mkdir -p "$pkgdir/etc/udev/rules.d"
  cp driver/* "$pkgdir/etc/udev/rules.d"

  mkdir -p "$pkgdir/usr/bin/ikalogic/scanastudio"
  cp bin/scanastudio "$pkgdir/usr/bin/ikalogic/scanastudio"
  ln -s /usr/bin/ikalogic/scanastudio/scanastudio "$pkgdir/usr/bin/scanastudio"

  mkdir -p "$pkgdir/usr/bin/ikalogic/scanastudio/imageformats"
  cp -r bin/imageformats/lib* "$pkgdir/usr/bin/ikalogic/scanastudio/imageformats"

  mkdir -p "$pkgdir/usr/share/mime/packages"
  cp mime/scanastudio.xml "$pkgdir/usr/share/mime/packages"

  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  cp -r mime/hicolor/* "$pkgdir/usr/share/icons/hicolor"

  mkdir -p "$pkgdir/usr/share/icons"
  cp mime/application-x-scanastudio.png "$pkgdir/usr/share/icons"

  mkdir -p "$pkgdir/usr/share/applications"
  cp mime/scanastudio.desktop "$pkgdir/usr/share/applications"
}


