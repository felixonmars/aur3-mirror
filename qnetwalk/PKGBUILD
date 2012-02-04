# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=qnetwalk
pkgver=1.3
pkgrel=1
pkgdesc="You are the system administrator and your goal is to connect each computer to the central server."
arch=('i686' 'x86_64')
url="http://qt.osdn.org.ua/qnetwalk.html"
license=('GPL')
depends=('qt')
source=(http://qt.osdn.org.ua/$pkgname-$pkgver.tar.gz \
        $pkgname-install.diff)

md5sums=('bc55ac6b692ef6f7e347b039b12e3efe'
         '596783a9fa4343a4576533ffae3fba50')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  qmake
  make || return 1

  patch -Np0 -i "${srcdir}/$pkgname-install.diff"

  make INSTALL_ROOT="${pkgdir}" install
}
