# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: cromo <dawid@klej.net>

pkgname=hotkey-setup
pkgver=0.1
pkgrel=23
_pkgrel=21
pkgdesc="Detects the laptop hardware and configures its hotkeys for useful keycodes" 
arch=('i686' 'x86_64')
url="http://packages.debian.org/unstable/misc/hotkey-setup" 
license=('BSD')
depends=('dmidecode>=2.7' 'laptop-detect')
conflicts=('tpb')
install=hotkey-setup.install
source=(http://ftp.debian.org/debian/pool/main/h/${pkgname}/${pkgname}_${pkgver}-${pkgrel}.tar.gz \
        hotkey-setup
        hotkey-setup.install)
md5sums=('ec366bfda1c5a654e14a21bf2d0817e7'
         '2996a8a92043e6155ae2a40643d82b2d'
         'bf9de56dcd5e631338c31f208f72a4e9')

build() { 
    cd $srcdir/$pkgname-$pkgver-$_pkgrel
    make 
}

package() {
    cd $srcdir/$pkgname-$pkgver-$_pkgrel

    install -D dumpkeycodes $pkgdir/usr/sbin/dumpkeycodes
    install -D thinkpad-keys $pkgdir/usr/sbin/thinkpad-keys
    install -D -m644 key-constants $pkgdir/usr/share/$pkgname/key-constants
    install -m644 *.hk $pkgdir/usr/share/$pkgname/
    install -D -m755 $srcdir/hotkey-setup $pkgdir/etc/rc.d/hotkey-setup
    install -D -m644 debian/copyright $pkgdir/usr/share/licenses/$pkgname/license.txt
}
