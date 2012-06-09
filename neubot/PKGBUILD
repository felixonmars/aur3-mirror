# Maintainer: Davide Allavena <davide.allavena@gmail.com>
pkgname=neubot
pkgver=0.4.12
pkgrel=2
epoch=
pkgdesc="Network neutrality bot"
arch=('x86_64' 'i686')
url="http://www.neubot.org/"
license=('GPL')
depends=('less>=418' 'sqlite>=3.5.9-6' 'procps-ng>=1.3.2-7' 'python2')
makedepends=()
optdepends=()
conflicts=()
options=()
install=neubot.install
changelog=
source=("http://releases.neubot.org/_packages/$pkgname-$pkgver.tar.gz" 'neubot')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR=$pkgdir PYTHON=python2.7 install
  install -d ${pkgdir}/etc/rc.d/
  install  -o 0 -g 0 -m755 $srcdir/neubot ${pkgdir}/etc/rc.d/
  sed -i -e 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/' ${pkgdir}/usr/bin/neubot

  }

# vim:set ts=2 sw=2 et:
md5sums=('c17fe74cde719ceca2ca6946d5ba9450'
         'fa1f37e5b2717cc4dd7dccefe3d34a7b')

