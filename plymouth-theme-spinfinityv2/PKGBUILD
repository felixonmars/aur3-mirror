pkgname="plymouth-theme-spinfinityv2"
pkgver=0.1
pkgrel=1
url="https://plus.google.com/104103936766014612225/posts/T2t9Seipg8Q"
pkgdesc="arch-logo + spinfinity"
arch=('any')
license=('GPL')
depends=('plymouth')
options=('')
source=("http://ubuntuone.com/0KqixlXEb2zNMuWWRULmfx")

package() {
    cd $srcdir/
    
    cd spinfinityv2
    mkdir -p $pkgdir/usr/share/plymouth/themes/spinfinityv2
    install -Dm644 * $pkgdir/usr/share/plymouth/themes/spinfinityv2
    install -Dm644 ../splash $pkgdir/etc/initramfs-tools/conf.d/splash
}
md5sums=('f5d5debb04eb02f0f96532e77f46c8f9')
