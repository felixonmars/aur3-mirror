pkgname=newpasswd
pkgver=0.3
pkgrel=1
pkgdesc="Generate a brand new password"
url="https://github.com/simukis/newpasswd"
license=('ICS')
arch=('any')
depends=('python')
short_hash='4f7d8cf'
source=('https://github.com/simukis/newpasswd/zipball/'$short_hash)
md5sums=('c91a04504c8be7e3c5960297fc1185c5')

package() {
    cd $srcdir/simukis-newpasswd-$short_hash/
    mv usr/ $pkgdir/
}
