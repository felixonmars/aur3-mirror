# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=xkcdviewer
pkgver=0.1
pkgrel=3
pkgdesc="enjoy xkcd comics without any browser, simply using this graphical front-end."
arch=('i686' 'x86_64')
url="http://gtk-apps.org/content/show.php/XKCD+viewer?content=91376"
license=('GPL')
depends=('gtk2-perl' 'perl-libwww')
source=(http://www.autistici.org/fox/files/XKCD_viewer/XKCD_viewer-0.1.tar.gz
		$pkgname.sh)
md5sums=('446b45a36d3c30b6a9b147fd49d6c0dd'
         '253264400a9addd9f96090916fc5f53b')

build() {
  cd $srcdir/XKCD_viewer
  perl Makefile.PL
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -Dm755 ../$pkgname.sh $pkgdir/usr/bin/$pkgname
  
}

