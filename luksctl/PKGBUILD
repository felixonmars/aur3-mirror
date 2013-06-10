# Maintainer: Julius Adorf <jeadorf@gmail.com>
pkgname=luksctl
pkgver=0.0.2
pkgrel=2
pkgdesc="Control devices with LVM on top of LUKS."
arch=('any')
url="https://bitbucket.org/jeadorf/luksctl"
license=('GPL')
depends=('python2' 'util-linux' 'cryptsetup' 'lvm2')
source=(https://bitbucket.org/jeadorf/luksctl/downloads/luksctl-$pkgver.tar.gz)
md5sums=('e8ddb91798484bded80d2925bd178a2c')

package() {
    install -Dm755 "$srcdir/luksctl"                    "$pkgdir/usr/bin/luksctl"
    install -Dm644 "$srcdir/examples/backup"            "$pkgdir/etc/luksctl/examples/backup"
    install -Dm644 "$srcdir/doc/luksctl.profile.5.gz"   "$pkgdir/usr/share/man/man5/luksctl.profile.5.gz"
    install -Dm644 "$srcdir/doc/luksctl.8.gz"           "$pkgdir/usr/share/man/man8/luksctl.8.gz"
}
