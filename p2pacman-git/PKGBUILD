# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=p2pacman-git
pkgver=b95c3ef
pkgrel=1
pkgdesc="Wrapper, daemon and server for pacman p2p support"
arch=('i686' 'x86_64')
url="https://github.com/onny/p2pacman.git"
license=('unknown')
depends=('python-libtorrent-rasterbar' 'python-requests' 'python-progressbar' 'opentracker' 'rsync' 'mktorrent')
backup=('etc/conf.d/p2pacman.conf'
        'etc/conf.d/p2pacmand.conf'
        'etc/conf.d/p2pacman-server.conf')
source=('git+https://github.com/onny/p2pacman.git')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/p2pacman"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/p2pacman"
  install -Dm755 "p2pacman.py" "${pkgdir}/usr/bin/p2pacman"
  install -Dm755 "p2pacmand.py" "${pkgdir}/usr/bin/p2pacmand"
  install -Dm755 "p2pacman-server.py" "${pkgdir}/usr/bin/p2pacman-server"
  install -Dm644 "p2pacman.conf" "${pkgdir}/etc/conf.d/p2pacman.conf"
  install -Dm644 "p2pacmand.conf" "${pkgdir}/etc/conf.d/p2pacmand.conf"
  install -Dm644 "p2pacman-server.conf" "${pkgdir}/etc/conf.d/p2pacman-server.conf"
  install -Dm644 "p2pacmand.service" "${pkgdir}/usr/lib/systemd/system/p2pacmand.service"
}

# vim:set ts=2 sw=2 et:
