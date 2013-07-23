# Contributor: Nekmo <contacto@nekmo.com>

pkgname=naw
pkgver=1.0
pkgrel=3
pkgdesc="Run the command 'cat' like 'naw'."
arch=(any)
url="http://nekmo.com"
license=('GPL')
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
md5sums=() #generate with 'makepkg -g'
install=

package(){
    mkdir -p $pkgdir/usr/bin/
    ln -s /usr/bin/cat $pkgdir/usr/bin/naw
}

# vim:set ts=2 sw=2 et: