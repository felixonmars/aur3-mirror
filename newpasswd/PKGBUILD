pkgname=newpasswd
pkgver=0.4
pkgrel=2
pkgdesc="Generate a brand new password"
url="https://github.com/nagisa/newpasswd"
license=('ICS')
arch=('any')
depends=('python')
source=('git://github.com/nagisa/newpasswd.git')
md5sums=('SKIP')

package() {
    cd $pkgname
    mv usr/ $pkgdir/
    chmod +x $pkgdir/usr/bin/newpasswd
}
