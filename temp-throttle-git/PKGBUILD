# Maintainer: Ryan Young <ry an. ry. young@gmail.com> (omit spaces)
pkgname=temp-throttle-git
_gitname=temp-throttle
pkgver=ee24c7e
pkgrel=1
pkgdesc="A shell script for throttling system CPU frequency based on a desired maximum temperature."
arch=('any')
url="https://github.com/Sepero/temp-throttle"
license=('GPL2')
depends=('bash')
source=('git://github.com/Sepero/temp-throttle.git'
        'temp-throttle@.service')
md5sums=('SKIP'
         '8363941f8e0864fccc20f6dcdf6f35db')

pkgver() {
    cd $_gitname
    git describe --always | sed 's|-|.|g'
}
package() {
    cd $_gitname
    install -Dm755 'temp_throttle.sh' "$pkgdir/usr/bin/temp_throttle"
    install -Dm644 'README.md' "$pkgdir/usr/share/doc/temp-throttle/README"
    install -Dm644 "$srcdir/temp-throttle@.service" "$pkgdir/usr/lib/systemd/system/temp-throttle@.service"
}