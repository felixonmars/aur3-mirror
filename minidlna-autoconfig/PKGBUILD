# Maintainer: rodolpheh <https://github.com/rodolpheh/>
# Contributor: pPailleux <https://github.com/pPailleux/>
pkgname=minidlna-autoconfig
pkgver=20140406
pkgrel=1
pkgdesc="Create default config files when users launch minidlna if necessary. Start minidlna as a user for systemd."
arch=('any')
url="https://github.com/rodolpheh/minidlna-autoconfig"
license=('GPL')
groups=()
depends=('minidlna')
makedepends=('git')
optdepends=()
provides=('minidlna-autoconfig')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+https://github.com/rodolpheh/minidlna-autoconfig.git)
noextract=()
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}