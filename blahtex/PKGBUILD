# Contributor: Leewings Ng <osideal@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=blahtex
pkgver=0.9
pkgrel=1
pkgdesc="Converts TeX equations into MathML"
arch=('i686' 'x86_64')
url="http://gva.noekeon.org/blahtexml/"
license=('GPL')
depends=('xerces-c')
source=("http://gva.noekeon.org/blahtexml/blahtexml-${pkgver}-src.tar.gz"
        "unistd-header.patch")
md5sums=('ed790599223c2f8f6d205be8988882de'
         'ecdb35b27a6fda011b5990af32d2151a')

build()
{
  cd "$srcdir"
  rm -rf "$pkgname-$pkgver-build"
  cp -r "${pkgname}ml-$pkgver" "$srcdir/$pkgname-$pkgver-build"
  cd "$pkgname-$pkgver-build"
  patch -p1 < ../unistd-header.patch || return 1
  make blahtex-linux || return 1
}

package()
{
    cd "$srcdir/$pkgname-$pkgver-build"
    install -D blahtex $pkgdir/usr/bin/blahtex
}
