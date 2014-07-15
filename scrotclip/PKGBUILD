# Maintainer: Robert Orzanna <orschiro at gmail dot com>

pkgname=scrotclip
pkgver=1.0
pkgrel=1
pkgdesc="Simple wrapper for Scrot with libnotify and copy-to-clipboard support"
arch=('any')
url="https://gist.github.com/orschiro/af87e0557a67477f9ea7"
license=('GPL2')
depends=('libnotify' 'copyq' 'scrot')
source=('https://gist.githubusercontent.com/orschiro/af87e0557a67477f9ea7/raw/e2f5040a22b6c943c3e4a394d183ced28163ee4d/scrotclip.sh')
md5sums=('91461ea3fd0084118ae1f345fd2dec7e')

package() {
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/scrotclip.sh" "$pkgdir/usr/bin/scrotclip"
}
