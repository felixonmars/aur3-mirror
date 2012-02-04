# Contributor: Mario García H. <code933k@gmail.com>
# http://keyjunkie.blogspot.com

pkgname=shanty
pkgver=3
pkgrel=1
pkgdesc="A perl script for rendering ascii art alike postcripts out of an image"
url="http://www.codebunny.org/coding/$pkgname"
arch=('i686' 'x86_64')
license=('BSD')
depends=('perl')
optdepends=('fakeroot')
source=(http://www.codebunny.org/coding/$pkgname/download/$pkgname-$pkgver.tar.gz)
md5sums=('5d2381dc6a33965b5ecca90826e7825e')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  install -d -m 0755 ${pkgdir}/usr/bin
  install -d -m 0755 ${pkgdir}/usr/share/doc/${pkgname}
  install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}

  install -m 0755 $pkgname ${pkgdir}/usr/bin
  install -m 0644 changelog.txt ${pkgdir}/usr/share/doc/${pkgname}
  install -m 0644 manual.txt ${pkgdir}/usr/share/doc/${pkgname}
  install -m 0644 licence.txt ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
