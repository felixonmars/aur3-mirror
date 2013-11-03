# Contributor: Andre Klitzing <andre () incubo () de>
pkgname=pmccabe
pkgver=2.6
pkgrel=1
pkgdesc="McCabe-style function complexity and line counting for C and C++"
arch=('i686' 'x86_64')
url="http://people.debian.org/~bame/pmccabe/"
license=('GPL')
source=(http://ftp.debian.org/debian/pool/main/p/$pkgname/${pkgname}_$pkgver.tar.gz makefile.patch)

prepare()
{
  cd "$srcdir/$pkgname"
  patch -p0 -i "$srcdir/makefile.patch"
}

build()
{
  cd "$srcdir/$pkgname"
  make
}

package()
{
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

sha256sums=('e490fe7c9368fec3613326265dd44563dc47182d142f579a40eca0e5d20a7028'
            'aa3502ab54a26c305e4f29bd7787587f0f34c2f47506b6a652b21598ca2a0812')
