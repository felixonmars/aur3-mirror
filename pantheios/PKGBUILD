# Maintainer: Lambert Clara <lambert.clara at yahoo dot fr>
pkgname=pantheios
pkgver=1.0.1_beta214
pkgrel=2
pkgdesc="A fully type-safe, extensible, extremely efficient C++ logging API library."
arch=(any)
url="http://www.pantheios.org"
license=('BSD')
groups=()
depends=('stlsoft>=1.9.117-2')
makedepends=('gcc>=4.6.0')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='pantheios.install'
changelog=
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-1.0.1-beta214.zip
        $pkgname.sh)
noextract=()
md5sums=('5b7880367db1ba8b51912d0f301d9ed7'
         '404d26b3a13654fdb1d71383b0129b51')

build() {

  if [ $CARCH == "x86_64" ]; then
    echo "64-bits architecture detected, pantheios will be built using gcc46.unix.file64bit"
    cd $srcdir/$pkgname-${pkgver/_/-}/build/gcc46.unix.file64bit
  else
    echo "pantheios will be built using gcc46.unix"
    cd $srcdir/$pkgname-${pkgver/_/-}/build/gcc46.unix
  fi

  make build.libs || return 1

  mkdir -p $pkgdir/usr/include/$pkgname
  mkdir -p $pkgdir/usr/lib

  cp -r $srcdir/$pkgname-${pkgver/_/-}/include $pkgdir/usr/include/$pkgname

  # cleanup of useless readme file
  rm $srcdir/$pkgname-${pkgver/_/-}/lib/readme.html

  cp -r $srcdir/$pkgname-${pkgver/_/-}/lib $pkgdir/usr/lib/$pkgname

  install -d "${pkgdir}/etc/profile.d"
  install -d "${pkgdir}/usr/share/licenses/$pkgname"
  install -m755 "${srcdir}/$pkgname.sh" "${pkgdir}/etc/profile.d/" || return 1
  install -D -m644 $srcdir/$pkgname-${pkgver/_/-}/LICENSE.txt ${pkgdir}/usr/share/licenses/$pkgname/ || return 1
}

# vim:set ts=2 sw=2 et:
