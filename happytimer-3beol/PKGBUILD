# Maintainer: xylosper <darklin20@gmail.com>

pkgname=('happytimer-3beol')
_pkgname=happytimer
pkgver=2.2.1
pkgrel=1
arch=('i686' 'x86_64')
url=("http://kldp.net/projects/$_pkgname")
license=('GPL')
makedepends=('gstreamer0.10' 'gtk3' 'mxml' 'libnotify' 'gcc')
source=("$_pkgname-$pkgver.tar.gz")
md5sums=('c1649bf91d72316b71777ee8c2e52526')


build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make -k check
}

package_happytimer-3beol() {
  pkgdesc=("Alarm clock for the GNOME"
		"Happytimer is a timer application that sits in GNOME\'s notification area."
		"You will never forget your happiest time anymore.")
  depends=('gstreamer0.10-ugly-plugins' 'gstreamer0.10' 'gtk3' 'mxml' 'libnotify')
  provides=('happytimer')
  conflicts=('happytimer')
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
