
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de>

_pkgbase=libgdiplus
pkgname=lib32-$_pkgbase
pkgver=2.10.9
pkgrel=2
pkgdesc="An Open Source Implementation of the GDI+ API (32 bit)"
arch=('x86_64')
license=('MPL' 'LGPL')
url="http://www.mono-project.com"
depends=('lib32-libtiff' 'lib32-cairo' 'lib32-libexif' 'lib32-giflib' 'lib32-glib2' "$_pkgbase")
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://download.mono-project.com/sources/$_pkgbase/$_pkgbase-$pkgver.tar.bz2
        libpng15.patch
        libgdiplus0-giflib5.patch
        libgdiplus-2.10.9-gold.patch
        libgdiplus-freetype-2.5.1.patch)
md5sums=('b4615c14584b5d73cbb9757c28887654'
         'a2d143676bbaceeb88b4c34069e93986'
         'ad97558c721106eea03c7808b501814b'
         '95fb92750c131ce9287419c3ac5fcb76'
         '9dcf84cebe9c9e3bb5a1f13561aae987')

prepare() {
  cd ${_pkgbase}-${pkgver}
  patch -Np0 -i ../libpng15.patch
  patch -Np1 -i ../libgdiplus0-giflib5.patch
  patch -Np1 -i ../libgdiplus-2.10.9-gold.patch
  patch -Np0 -i ../libgdiplus-freetype-2.5.1.patch

  sed -i -e 's/-L\${libjpeg_prefix}\/lib -ljpeg/-ljpeg/' configure
}

build() {
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --with-cairo=system \
                --libdir=/usr/lib32 CC='gcc -m32'
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
