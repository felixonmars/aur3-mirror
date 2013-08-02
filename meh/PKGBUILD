# Maintainer: kiooeht <kiooeht@gmail.com>
# Contributor: John Hawthorn <jhawthor@uvic.ca>
# Contributor: Army <uli armbruster google>

pkgname=meh
pkgver=0.3
pkgrel=4
pkgdesc="A minimal image viewer using raw XLib."
arch=('i686' 'x86_64')
url="http://www.johnhawthorn.com/meh/"
license=('MIT')
depends=('libxext' 'libjpeg' 'giflib' 'libpng')
optdepends=('imagemagick')
source=(
http://web.uvic.ca/~jhawthor/$pkgname-$pkgver.tar.gz
giflib-4.2-fix.patch
giflib-5.x-fix.patch
)

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i $srcdir/giflib-4.2-fix.patch
  patch -p1 -i $srcdir/giflib-5.x-fix.patch
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 meh $pkgdir/usr/bin/meh
  install -D -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('7fbc839fe6af33f3f576d067dbe804dd'
         '740549a983965f3a3dc72e91d0e0d47f'
         'b0be4710ab0538897734130d5387c9e6')
