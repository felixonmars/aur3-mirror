# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>
# Maintainer: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=abcm2ps-devel
pkgver=7.5.2
pkgrel=1
pkgdesc="a command line program which converts ABC to music sheet in PostScript format."
arch=('i686' 'x86_64')
url="http://moinejf.free.fr/"
license=('GPL')
depends=('glibc')
conflicts=('abcm2ps')
groups=(abc)
source=(http://moinejf.free.fr/abcm2ps-$pkgver.tar.gz)
md5sums=('0599b0c391a20d5a12c615e7aab87050')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr docdir=$startdir/pkg/usr/share/doc install
}
