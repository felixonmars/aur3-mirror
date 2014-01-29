# Maintainer: Marcus Møller <powrtoch.org>
pkgname=drtv-dl-git
pkgver=20140128
pkgrel=1
pkgdesc="Small command-line program to download videos from DR TV (http://www.dr.dk/tv/)"
arch=(any)
url="https://github.com/marcusmoller/drtv-dl"
license=('custom:unlicense')
depends=('python')
makedepends=('git')

source=($pkgname::"git+https://github.com/marcusmoller/drtv-dl.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    # drtv-dl
    install -Dm755 drtv-dl.py ${pkgdir}/usr/bin/drtv-dl

    # license
    install -Dm755 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

