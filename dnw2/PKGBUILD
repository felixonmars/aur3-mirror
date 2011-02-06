# Maintainer : athurg<athurg@gooth.cn>

pkgname=dnw2
pkgver=svn
pkgrel=1
pkgdesc="S3C2440 dnw for linux.Use libusb instead of secbulk."
url="http://c8051f320dev.googlecode.com/"

groups=('base-devel')
source=()
_SVN_ROOT=http://c8051f320dev.googlecode.com/svn/trunk/dnw2_linux/
arch=('i686' 'x86_64')
depends=('libusb')
provide=('dnw' 'dnw2')
license=('GPL')

build() {
    cd $srcdir/
    svn co ${_SVN_ROOT} $pkgname
    cd $pkgname
    make || return 1
    install -D -m755 $pkgname ${pkgdir}/usr/bin/${pkgname} || return 1
}