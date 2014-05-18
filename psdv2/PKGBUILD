# Maintainer: Timofey Titvets nefelim4ag@gmail.com
pkgname='psdv2'
pkgver=0.1
pkgrel=1
pkgdesc='Replace profile-sync-daemon, another author, another code, another functionality.'
arch=('any')
url='https://github.com/TimofeyTitovets/PSDv2'
license=('GPL')
depends=('bash' 'binutils' 'coreutils' 'gawk' 'glibc' 'grep' 'rsync')
conflicts=('firefox-sync' 'goanysync' 'go-anysync-git' 'iceweasel-sync' 'tmpfs-store' 'tmpfs-sync' 'user-profile-sync-daemon' 'profile-sync-daemon')
backup=('etc/psd.conf')
source=("$pkgname"::'git://github.com/TimofeyTitovets/PSDv2.git#branch=master')
md5sums=( 'SKIP' )

package() {
    install -Dm755 $srcdir/$pkgname/psd                $pkgdir/bin/psd
    install -Dm644 $srcdir/$pkgname/psd.conf           $pkgdir/etc/psd.conf
    install -Dm644 $srcdir/$pkgname/psd.service        $pkgdir/usr/lib/systemd/system/psd.service
    install -Dm644 $srcdir/$pkgname/psd-resync.service $pkgdir/usr/lib/systemd/system/psd-resync.service
    install -Dm644 $srcdir/$pkgname/psd-resync.timer   $pkgdir/usr/lib/systemd/system/psd-resync.timer
}

