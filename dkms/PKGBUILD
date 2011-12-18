# $Id:$
# Contributor: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)
# Maintainer: Balwinder S "bsd" Dheeman (bdheeman AT gmail.com)

pkgname=dkms
pkgver=2.2.0.3
pkgrel=1
pkgdesc="A Dynamic Kernel Modules System or Framework"
arch=('any')
url=http://linux.dell.com/dkms/
license=('GPL')
depends=('linux-headers')
backup=('etc/dkms/framework.conf')
install=dkms.install
changelog=ChangeLog
source=(http://linux.dell.com/$pkgname/permalink/$pkgname-$pkgver.tar.gz
    'dkms_autoinstaller.sh')

build() {
    : need not build anything, huh
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    # replace dkms_autoinstaller and create symlink
    mkdir -p $pkgdir/etc/rc.d
    install -m755 $srcdir/dkms_autoinstaller.sh $pkgdir/usr/lib/dkms/dkms_autoinstaller
    ln -s ../../usr/lib/dkms/dkms_autoinstaller $pkgdir/etc/rc.d/
}

# vim:set ts=2 sw=2 et:
md5sums=('11a8aaade2ebec2803653837c7593030'
         '2697b7251e990d053768ad1de4cbe60f')
