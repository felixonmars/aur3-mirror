# Contributor: Jack <nim901@gmail.com>
pkgname=hcal-gtk
pkgver=0.6.3
pkgrel=1
pkgdesc="HebrewCalendar is a GTK class which shows the Hebrew dates and holidays and their corresponding Gregorian date."
depends=('gtk2' 'libgnome' 'libhdate' 'sqlite3')
url="http://hcal.sourceforge.net/"
source=(http://dl.sourceforge.net/sourceforge/hcal/hcal-gtk-0.6.3.tar.gz)
md5sums=(1043b847bec0b87a94e18d6777efbfc6)

build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr --with-libhdate
make
make DESTDIR=$startdir/pkg install
}
