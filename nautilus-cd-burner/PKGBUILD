# Contributor: Ty John (sand_man)  <ty (at) eye-of-odin (dot) com>
pkgname=nautilus-cd-burner
pkgver=2.25.3
pkgrel=1
pkgdesc="Nautilus CD Burner"
arch=('i686' 'x86_64')
url="http://ftp.gnome.org/pub/GNOME/sources/nautilus-cd-burner/"
license=('GPL')
groups=()
depends=('nautilus' 'hal')
makedepends=('intltool')
optdepends=('gnome-mount')
provides=(nautilus-cd-burner)
conflicts=()
replaces=()
backup=()
options=()
md5sums=('ba9a0c80b57d4694e7e5379058adcdb3')
source=("http://ftp.acc.umu.se/pub/GNOME/sources/$pkgname/2.25/$pkgname-$pkgver.tar.gz")
noextract=()

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

