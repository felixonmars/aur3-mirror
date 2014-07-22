# Maintainer: Bogdan D. <dmbohdan[at]mail[dot]ru>
pkgname=timecamp
pkgver=1.3.3.7
pkgrel=1
pkgdesc="TimeCamp - time tracking software"
url="http://www.timecamp.com"
arch=('x86_64')
license=('EULA')
source=("https://www.timecamp.com/downloadsoft//${pkgname}_${pkgver}_amd64.deb")
md5sums=('73fd3e5c62d8dc1fb2b8fb40b8bf8093')

build() {
    cd $srcdir
    tar -xf data.tar.gz
}

package() {
   cp -a $srcdir/usr $pkgdir/
}

# vim:set ts=2 sw=2 et:
