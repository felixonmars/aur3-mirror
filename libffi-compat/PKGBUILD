# Maintainer: Gary Hollis <ghollisjr@gmail.com>
pkgname=libffi-compat
pkgver=1.0
pkgrel=1
pkgdesc="Provides script which creates libffi header links in /usr/include"
arch=('x86_64' 'i686')
url="https://github.com/ghollisjr/libffi-compat"
license=('Public Domain')
groups=()
depends=('libffi' 'bash' 'grep' 'sed' 'pkg-config')
makedepends=('git')
checkdepends=()
optdepends=()
provides=(/usr/bin/update-libffi-compat)
conflicts=()
replaces=()
backup=()
options=()
#install=
#changelog=
source=("$pkgname"::'git://github.com/ghollisjr/libffi-compat.git')
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

package() {
    mkdir -p $pkgdir/usr/bin/
    cp $srcdir/$pkgname/update-libffi-compat $pkgdir/usr/bin/
}
