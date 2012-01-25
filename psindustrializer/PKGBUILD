# Contributor: Iwan Gabovitch <qubodup@gmail.com>
pkgname=psindustrializer
pkgver=0.2.5
pkgrel=1
pkgdesc="Power Station Industrializer procedurally generates percussion sounds through physical modelling"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/industrializer/"
license=("GPL")
depends=('gtkglarea' 'audiofile')
makedepends=('sed')
optdepends=()
conflicts=()
source=(http://downloads.sourceforge.net/project/industrializer/industrializer/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('80d6cca09b9298f8af6a9e0c9367039f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # dirty fixes ahead
  sed -i 's/if test "$AUDIOFILE_CONFIG" = "no" ; then/if false; then/' configure
  # those seem to be not necessary after adding --disable-audiofiletest?
  #sed -i 's/if test -f conf.audiofiletest ; then/if true; then/' configure
  #sed -i 's/{ (exit 1); exit 1; }; }/}/' configure

  CFLAGS=-laudiofile ./configure --disable-audiofiletest --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install

}

