# Maintainer: Dominik Peteler <archlinux@with-h.at>

pkgname=hostsd
pkgver=1
pkgrel=1
pkgdesc="Generate /etc/hosts from several separate config files"
arch=('any')
url="https://github.com/WithHat/${pkgname}"
license=('GPL3')
depends=('filesystem' 'bash' 'grep')
makedepends=('git')
changelog="${pkgname}.changelog"
source=("https://github.com/WithHat/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c5989bd4bf201b247671615ca6d1259873b9a8a9e60f677088f77c57662bf6bb')

package() {
    install -D "$srcdir/hosts-gen" "$pkgdir/usr/bin/hosts-gen"
    install -D -m644 "$srcdir/hosts-gen.service" "$pkgdir/usr/lib/systemd/system/hosts-gen.service"
}
