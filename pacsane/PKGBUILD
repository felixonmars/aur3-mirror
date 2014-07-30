developer=http://indiebox.net/
maintainer=http://indiebox.net/
pkgname=$(basename $(pwd))
pkgver=0.5
pkgrel=1
pkgdesc="Check pacman database for internal consistency"
arch=( 'any' )
url="https://github.com/indiebox/tools"
license=('GPL')
depends=('perl' 'xz' )
makedepends=()
source=('pacsane')
md5sums=('79b6e2ec763dff0b336d99b6f3a861cc')

package() {
    mkdir -m755 -p $pkgdir/usr/bin/
    install -m755 $startdir/pacsane $pkgdir/usr/bin/
}
