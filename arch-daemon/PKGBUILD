# Maintainer: Ben Morgan <benm.morgan@gmail.com>
pkgname=arch-daemon
pkgver=2.0
pkgrel=1
pkgdesc="Easily manipulate daemons in /etc/rc.d on Arch Linux"
arch=('any')
url="https://github.com/cassava/arch-daemon"
license=('ISC')
install=('arch-daemon.install')
source=("https://github.com/downloads/cassava/$pkgname/$pkgname-$pkgver.tar.gz")

build() {
  cd $srcdir/$pkgname-$pkgver
  install -d ${pkgdir}/usr/bin/
  install -m755 daemon ${pkgdir}/usr/bin/daemon
  
  # install bash completion
  install -d ${pkgdir}/etc/bash_completion.d/
  install -m644 arch-daemon.bash-completion ${pkgdir}/etc/bash_completion.d/arch-daemon
}

md5sums=('27287118ae380459fc9e1fab78027e40')
