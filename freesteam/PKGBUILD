# Maintainer: Nicolas Boulanger <nicolas.boulanger_aur at gadz dot org>
pkgname=freesteam
pkgver=2.0
pkgrel=2
pkgdesc="A library for calculating steam data"
arch=(any)
url="http://freesteam.sourceforge.net/"
license=('GPL')
groups=()
depends=(gsl)
makedepends=(scons)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2/download)
noextract=()
md5sums=(a33440c584fa2fa8ddef7a4596401785) #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  scons || return 1
  scons INSTALL_ROOT="$pkgdir/" INSTALL_PREFIX="/usr" install || return 1
}
