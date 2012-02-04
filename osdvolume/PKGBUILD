# Contributor:  <>

pkgname=osdvolume
pkgver=1.2
pkgrel=1
pkgdesc="Adjusts volume and displays on OSD as KOSD. Suited for KDE4"
url="http://www.kde-apps.org/content/show.php/osdvolume?content=83176"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
install=$pkgname.install
source=(http://www.kde-apps.org/CONTENT/content-files/83176-$pkgname.tar.gz)

md5sums=('0e568ecf444db3036c3db1171e3365bd')

build() {
  cd "$srcdir/$pkgname"
  qmake
  make || return 1
  install -d "$pkgdir/usr/bin/"
  install -m 755 "$srcdir/$pkgname/osdvolume" "$pkgdir/usr/bin/" || return 1
}

