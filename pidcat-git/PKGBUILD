# Maintainer: burntcookie90

pkgname=pidcat-git
pkgver=1.4.1.r2.gd4d265a
pkgrel=2
pkgdesc="Colored logcat script which only shows log entries for a specific application package."
conflicts=("pidcat")
provides=("pidcat")
license=('Apache')
url="https://github.com/JakeWharton/pidcat"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('git')
source=(${pkgname}::"git://github.com/JakeWharton/pidcat.git" "pidcat.patch")
md5sums=("SKIP" "88dd654d600d8de4ff42174d042f0a77")

pkgver() {
  cd "$srcdir/${pkgname}/"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	patch -N ${srcdir}/${pkgname}/pidcat.py pidcat.patch 
}

package() {
	install -D -m 755 ${srcdir}/${pkgname}/pidcat.py ${pkgdir}/usr/bin/pidcat
}
