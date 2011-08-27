# Maintainer: StoMoX <info@stomox.de>
pkgname=stomox-imagewriter
pkgver=1.3
pkgrel=2
pkgdesc="A GUI tool to write StoMoX.img (or other) to USB mass storage"
arch=(i686)
url="https://launchpad.net/usb-imagewriter"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname.tar.gz imagewriter.desktop) 
noextract=()
md5sums=('b8277d4194e2c5a89b0d44a5b46adf12'
         '03585f2a1dc77483080e0675292c5daa')
build() {
  cd "$srcdir/$pkgname"

  install -D -m755 bin/imagewriter $startdir/pkg/usr/bin/imagewriter
  mkdir -p $startdir/pkg/usr/lib/imagewriter
  install -D -m755 lib/imagewriter/find_devices.sh $startdir/pkg/usr/lib/imagewriter/
  install -D -m755 lib/imagewriter/imagewriter.py $startdir/pkg/usr/lib/imagewriter/imagewriter.py
  mkdir $startdir/pkg/usr/imagewriter
  install -D -m644 share/imagewriter/header.png $startdir/pkg/usr/share/imagewriter/header.png
  install -D -m644 share/imagewriter/imagewriter.glade $startdir/pkg/usr/share/imagewriter/imagewriter.glade
  install -D -m644 share/imagewriter/usb-stick.png $startdir/pkg/usr/share/imagewriter/usb-stick.png
  install -D -m644 share/locale/de/LC_MESSAGES/usb-imagewriter.mo $startdir/pkg/usr/share/locale/de/LC_MESSAGES/usb-imagewriter.mo
  mkdir -p $startdir/pkg/usr/share/applications  
  install -D -m644 $startdir/imagewriter.desktop $startdir/pkg/usr/share/applications/
}

