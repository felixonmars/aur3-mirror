# Maintainer: Alad Wenter `base64 -d <<< YWxhZEBhcmNobGludXguaW5mbwo=`
# Contributor: slowpoke <mail+aur at slowpoke dot io>
_pkgname=quickswitch-for-i3
pkgname=quickswitch-i3-git
pkgver=2.2.r35.g6ff65d3
pkgrel=1
pkgdesc="A python utility to quickly change to and locate windows in i3"
arch=(any)
url="https://github.com/proxypoke/quickswitch-for-i3"
license=(custom:WTFPL)
depends=(dmenu python-i3-git)
provides=(quickswitch-i3)
conflicts=(quickswitch-i3)
options=(!emptydirs)
source=(git+https://github.com/OliverUv/quickswitch-for-i3)
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
