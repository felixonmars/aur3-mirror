# Maintainer: Ben Morgan <neembi@googlemail.com>
pkgname=arch-daemon
pkgver=2.0
pkgrel=3
pkgdesc="Easily manipulate daemons in /etc/rc.d on Arch Linux"
license=('ISC')
arch=('any')
url='https://github.com/cassava/arch-daemon/wiki'
depends=('bash')
install=arch-daemon.install
source=("https://github.com/downloads/cassava/$pkgname/$pkgname-$pkgver.tar.gz")

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 daemon $pkgdir/usr/bin/daemon

  # install ISC license (like the MIT license)
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # install bash completion
  install -D -m644 arch-daemon.bash-completion $pkgdir/etc/bash_completion.d/arch-daemon
}

md5sums=('27287118ae380459fc9e1fab78027e40')
