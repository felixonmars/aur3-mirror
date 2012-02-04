# Maintainer: bmpvieira <mail AT bmpvieira DOT com>
pkgname=populations
pkgver=1.2.33
pkgrel=1
pkgdesc="Population genetic software (individuals or populations distances, phylogenetic trees)"
arch=('i686' 'x86_64')
url="http://bioinformatics.org/~tryphon/populations/"
license=('GPL')
makedepends=('cmake')
depends=('qt')
source=(https://launchpad.net/~olivier-langella/+archive/ppa/+files/${pkgname}_$pkgver-$pkgrel.tar.gz)
md5sums=('81a6c4ace3622ac93a1a0e68539a2e8f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
      cmake -DCMAKE_INSTALL_PREFIX=/usr
        make || return 1
          make DESTDIR=${pkgdir} install || return 1
        }

# vim:set ts=2 sw=2 et:
