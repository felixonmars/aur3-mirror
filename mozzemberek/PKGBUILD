# Contributor: Samed Beyribey <ras0ir at eventualis dot org>
pkgname=mozzemberek
pkgver=0.1.5.1
pkgrel=1
pkgdesc="MozZemberek is an extension which provides Turkish spell checking using Zemberek server installed on the same computer"
arch=('i686' 'x86_64')
url="http://code.google.com/p/zemberek"
license=('GPL')
depends=('firefox' 'zemberek-server')
makedepends=('xulrunner')
install=mozzemberek.install
source=(http://zemberek.googlecode.com/files/$pkgname-$pkgver.tar.gz
        version.patch)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
# Let's Rock
  patch -p0 -i $startdir/version.patch
make DESTDIR="$pkgdir/" MOZILLA_FIVE_HOME="/usr/lib/firefox-3.6" install-unpacked
}
md5sums=('52a9b294d907f7fc3bf0e51529a956a2'
         'bbbfb97a6cdb77731dcd23b542944d80')
