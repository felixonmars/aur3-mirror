# Maintainer: Gordin <9ordin @t gmail dot com>
 
pkgname=nodejs-profile
pkgver=1
pkgrel=1
pkgdesc='profile files to set the NODE_PATH for nodejs-* packages'
arch=any
url=http://nodejs.org
license=(custom)
depends=(nodejs)
source=(nodejs.sh nodejs.csh)
sha256sums=('f8e3b9a1545967c4148ce53af118d872e3a25c4163cb702927052a07c17c5ddd'
            'dad5eab05a38e3c9046d0e2c4ce845807eaf68812b2d1a1175bd658238d47203')
backup=('etc/profile.d/nodejs.csh'
        'etc/profile.d/nodejs.sh')

package() {
    mkdir -p "$pkgdir"/etc/profile.d
    cd "$srcdir"
    install -m755 nodejs.{c,}sh "$pkgdir"/etc/profile.d/
}
