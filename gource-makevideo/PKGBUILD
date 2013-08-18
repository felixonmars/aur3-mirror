# Author: m1kc <m1kc@yandex.ru>
# Maintainer: m1kc <m1kc@yandex.ru>

pkgname=gource-makevideo
pkgver=1.0
pkgrel=1
pkgdesc="A simple script to visualize git history using Gource."
arch=('any')
url="https://github.com/m1kc/gource-makevideo"
license=('GPL3')
groups=()
depends=('bash')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('gource-makevideo.sh')
noextract=()
md5sums=('3903bfb4a3bd50f93e43fa9d0934df05')

package() {
	cd "$srcdir"
	install -D gource-makevideo.sh "$pkgdir/usr/bin/gource-makevideo"
}
