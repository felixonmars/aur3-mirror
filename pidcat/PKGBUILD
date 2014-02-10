# Maintainer: burntcookie90

pkgname=pidcat
pkgver=1.4.1
pkgrel=1
pkgdesc="Colored logcat script which only shows log entries for a specific application package."
conflicts=("pidcat-git")
provides=("pidcat-git")
license=('Apache')
url="https://github.com/JakeWharton/pidcat"
arch=('i686' 'x86_64')
depends=('python2')
source=("https://github.com/JakeWharton/pidcat/archive/${pkgver}.tar.gz" "pidcat.patch")
md5sums=("16502b0a089be9c111ca45ae14f9867f" "88dd654d600d8de4ff42174d042f0a77")

build() {
	patch -N ${srcdir}/${pkgname}-${pkgver}/pidcat.py pidcat.patch 
}

package() {
	install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/pidcat.py ${pkgdir}/usr/bin/pidcat
}
