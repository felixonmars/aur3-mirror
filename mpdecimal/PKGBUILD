pkgname=mpdecimal
pkgver=2.2
pkgrel=1
pkgdesc="Package for correctly-rounded arbitrary precision decimal floating point arithmetic"
arch=('i686' 'x86_64')
url="http://www.bytereef.org/mpdecimal/index.html"
license=('custom')
makedepends=('unzip' 'sed')
source=(http://www.bytereef.org/software/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz \
        http://speleotrove.com/decimal/dectest.zip)
noextract=(dectest.zip)
md5sums=('83914b1c7395ac704d5f324224dfba67' '5bad77b2007040b4fbd2c6a25a57731b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  unset CFLAGS
  unset CXXFLAGS
  unset LDFAGS

  ./configure --prefix=/usr || return 1
  make || return 1
  cp ../dectest.zip tests
  grep -v "\$WGET http" tests/gettests.sh > tests/gettests.sh.tmp
  cat tests/gettests.sh.tmp > tests/gettests.sh
  rm tests/gettests.sh.tmp
  make check || return 1
  make DESTDIR=${pkgdir} install || return 1

  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt
}
