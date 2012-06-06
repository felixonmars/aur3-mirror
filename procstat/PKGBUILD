# Contributor: <n17ikh@gmail.com>

pkgname=procstat
pkgver=20090305
pkgrel=2
pkgdesc="Displays linux /proc/pid/stat in human-readable format"
arch=('i686' 'x86_64')
url="http://www.brokestream.com/procstat.html"
license=('custom')
source=('http://brokestream.com/procstat.c')
noextract=('procstat.c')
md5sums=('034922823379993ffda05c608d17637a')

build() {
  cd "$srcdir/"
  gcc -o $pkgname $pkgname.c
  mkdir -p $pkgdir/usr/bin 

  cp "$srcdir/$pkgname" "$pkgdir/usr/bin"

}
