# Contributor: Alexander Scherbakov a.k.a. neocrust <neocrust@gmail.com>

pkgname=meliae-iconset
pkgver=0.7
pkgrel=2
pkgdesc="Meliae icon theme pack"
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/Meliae?content=88482"
license=('GPL')
source=(http://paldo.org/paldo/sources/meliae-iconset/meliae-iconset-0.7.tar.bz2)
noextract=()
md5sums=('86700358ef1782e6c172d4bb3806a9c8')

build() {
echo
  mkdir -p "$pkgdir/usr/share/icons"
  cp -R "$srcdir/Meliae" "$pkgdir/usr/share/icons"
}
