# Maintainer:
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Peter Avramucz <muczy@freestart.hu>

pkgname=ramlog
pkgver=2.0.0
pkgrel=5
pkgdesc="RamLog copies files from /var/log into a ramdisk and mounts the ramdisk as /var/log"
arch=('any')
url="http://www.tremende.com/ramlog/"
license=('GPL3')
depends=('lsof' 'rsync')
makedepends=('patch')
install=$pkgname.install
source=(http://www.tremende.com/ramlog/download/$pkgname-$pkgver.tar.gz
        $pkgname-paths.patch $pkgname.rc $pkgname.service)
md5sums=('063c10d9cbe93f22631d37fee62e5c64'
         'de51d430c15bec122913a38e54fc3f9b'
         '7c8069997fa6a6483420a5552a009919'
         'e80c13886393ef4ea498f9dc2482ed23')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

# Fix du location
  sed -r 's/\/usr\/bin\/du/\/bin\/du/g' -i $pkgname

  patch -Np1 -i "${srcdir}"/$pkgname-paths.patch

  install -D -m755 $pkgname "${pkgdir}"/etc/$pkgname/$pkgname
  install -D -m644 $pkgname.8.gz "${pkgdir}"/usr/share/man/man8/$pkgname.8.gz
  install -D -m644 $pkgname.logrotate "${pkgdir}"/etc/logrotate.d/$pkgname
#  install -D -m755 $pkgname.cron "${pkgdir}"/etc/cron.daily/$pkgname

#  install -D -m755 "${srcdir}"/$pkgname.rc "${pkgdir}"/etc/rc.d/$pkgname
  install -Dm644 "${srcdir}"/$pkgname.service \
    "${pkgdir}"/usr/lib/systemd/system/$pkgname.service
}
