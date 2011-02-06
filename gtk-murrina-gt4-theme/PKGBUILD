
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
pkgname=gtk-murrina-gt4-theme
_pkgname=Murrina-GT4
__pkgname=Murrina-GT4-Rounded
pkgver=0.3.2
pkgrel=1
pkgdesc="A port of GT4_White Theme for the Murrine Engine"
arch=('i686' 'x86_64')
url="http://xfce-look.org/content/show.php/Murrina-GT4?content=45896"
license=('GPL')
groups=()
depends=('gtk-engine-murrine')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://xfce-look.org/CONTENT/content-files/45896-$_pkgname.tar.bz2 http://priyank.one09.net/files/$__pkgname.tar.bz2)
noextract=()
md5sums=('2be6ff699c15acf0c6c7f703123ae4e7' 'd0c9374cbda0eb3a2319e7cec61745b5')
sha1sums=('222ccbf9fb9c0d78156d202929ba7dac1dfd68cd' '08d564f5d28ac1b72f578c7ff59170c35ec4fac1')

build() {
  mkdir -p "$pkgdir/usr/share/themes"
  cp -R "$srcdir/$_pkgname" "$pkgdir/usr/share/themes"
  cp -R "$srcdir/$__pkgname" "$pkgdir/usr/share/themes"
}