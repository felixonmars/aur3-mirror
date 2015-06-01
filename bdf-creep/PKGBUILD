# Maintainer: Marshall Bowers <elliott.codes@gmail.com>
pkgname=bdf-creep
pkgver=0.31
pkgrel=1
pkgdesc="A pretty sweet 4px wide pixel font."
arch=(any)
url="https://github.com/romeovs/creep"
license=('MIT')
depends=(fontconfig xorg-font-utils)
source=('https://github.com/romeovs/creep/releases/download/0.31/creep.bdf'
        'https://raw.githubusercontent.com/romeovs/creep/0.31/LICENSE')
install=$pkgname.install
md5sums=('4b161568c62307a479fa6b48e9076e6e'
         '532ffff52753890c18a9759691269465')
package() {
    install -d "$pkgdir/usr/share/fonts/misc"
    install -d "$pkgdir/usr/share/licenses/bdf-creep"

    install -m644 "$srcdir/creep.bdf" "$pkgdir/usr/share/fonts/misc"
    install -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/bdf-creep"
}
