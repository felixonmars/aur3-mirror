# Contributer: giacomogiorgianni@gmail.com

pkgname=rhythmbox-webmenu
_name=WebMenu
pkgver=2.0
pkgrel=1
pkgdesc="WebMenu new plugin to search online on the current track in Rhythmbox"
url="https://github.com/afrancoto/WebMenu"
arch=('i686' 'x86_64')
license=('gpl')
groups=()
depends=('rhythmbox>=2.9')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=()
source=(http://cloud.github.com/downloads/afrancoto/$_name/${_name}_${pkgver}.tar.gz)
noextract=()
md5sums=('18435822bd63aa08868a70bcb13947aa')

build() {
  mkdir -p $pkgdir/usr/lib/rhythmbox/plugins/
  cp -R $srcdir/$_name $pkgdir/usr/lib/rhythmbox/plugins/
}
