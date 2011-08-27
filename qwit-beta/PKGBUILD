# Contributor: Ricardo Martins <ricardo+aur@scarybox.net>
# Contributor: Larry Hajali <larryhaja [at] gmail [dot] com>
# Contributor: Aurel Canciu <aurelcanciu [at] gmail [dot] com>

pkgname=qwit-beta
pkgver=1.1
pkgrel=2
pkgdesc="Qt4 cross-platform client for Twitter"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qwit/"
license=('GPL3')
depends=('qt' 'openssl' 'qoauth' 'qca-ossl')
provides=('qwit')
install=qwit.install
source=(http://qwit.googlecode.com/files/qwit-$pkgver-beta-src.tar.bz2)
md5sums=('b5d2985152413eaef6913a6e3fab8bc7')

build() {
  cd qwit-$pkgver-beta-src || return 1

  # Fix .desktop item.
  sed -i 's|Internet||' qwit.desktop || return 1
  # Compile and package the program.
  qmake -unix PREFIX=/usr -o Makefile qwit.pro || return 1
  make \
    CFLAGS="-pipe ${CFLAGS} -g -Wall -W -D_REENTRANT \$(DEFINES)" \
    CXXFLAGS="-pipe ${CXXFLAGS} -g -Wall -W -D_REENTRANT \$(DEFINES)" || return 1
  make INSTALL_ROOT="$pkgdir" install || return 1
}
