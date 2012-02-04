
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=xfce4-sugarlike-theme
pkgver=1
pkgrel=1
pkgdesc="an xfwm theme that kinda looks like the metacity Sugar theme"
arch=(any)
url="http://xfce-look.org/content/show.php/SugarLike?content=111097"
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
source=(http://xfce-look.org/CONTENT/content-files/111097-SugarLike.tar.gz)
noextract=()
md5sums=('f9395aac53a61c04228f93d1348e9a2e')

build() {
  mkdir -p $pkgdir/usr/share/themes
  cp -R $srcdir/Sugar* $pkgdir/usr/share/themes
}
