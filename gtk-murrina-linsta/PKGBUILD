# Contributor: xavi <xavi@netsons.org>
pkgname=gtk-murrina-linsta
_pkgname=Murrina-LiNsta
pkgver=0.1
pkgrel=2
pkgdesc="GTK2 theme for those who like Vista-ish themes"
arch=('i686' 'x86_64')
url="http://www.xfce-look.org/content/show.php/Murrina-LiNsta+(LiNsta+is+Not+Vista+%3B-)?content=61068"
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
source=(http://www.xfce-look.org/CONTENT/content-files/61068-Murrina-LiNsta-0.1.tar.gz)
noextract=()

md5sums=('8dd39425e37b8ff776d4ff03af287eb8')

build() {
  mkdir -p "$pkgdir/usr/share/themes"
  cp -R "$srcdir/$_pkgname" "$pkgdir/usr/share/themes"
}