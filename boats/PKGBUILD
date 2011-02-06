# Maintainer: Anders Lund <anders@alweb.dk>

pkgname=boats
pkgver=201004
pkgrel=1
pkgdesc="Boat Scenario is a race drawing tool for sailors. It is your ideal companion for training sessions, rule learning, strategy explanations and more."
arch=('i686' 'x86_64')
url="http://boats.berlios.de"
license=('GPL')
depends=('qt>=4.5.2' 'giflib>=4.1.6' 'xdg-utils' 'desktop-file-utils')
makedepends=('patch' 'make' 'gcc')
install=boats.install
source=("https://git.berlios.de/cgi-bin/gitweb.cgi?p=boats;a=snapshot;h=201004;sf=tgz")
md5sums=('4a2f439127c902fff9c6234d21d0c7dc')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  lrelease locale/*.ts
  qmake CONFIG+=unix_deploy GIF_EXPORT=1 PREFIX=/usr boats.pro
  make || return 1
  make INSTALL_ROOT=$pkgdir install || return 1
}

