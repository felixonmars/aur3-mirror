# Maintainer: Lambert Clara <lambert.clara at yahoo dot fr>
pkgname=stlsoft
pkgver=1.9.117
pkgrel=2
pkgdesc="A collection of STL and standard library extensions."
arch=(any)
url="http://www.stlsoft.org"
license=('BSD')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='stlsoft.install'
changelog=
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-hdrs.zip
        $pkgname.sh
        unused_typedefs.patch)
noextract=()
md5sums=('f1a2c934546059d39c407b111c6940e6'
         '0c99f3e9feac430b948baa555af48fcb'
         'bb405da5b5c7a651963754da3a254702')

build() {
  mkdir -p $pkgdir/usr/include/$pkgname

  msg "Applying patch to remove unused typedefs..."
  patch -Np1 --binary -i "$srcdir/unused_typedefs.patch" -d $srcdir/$pkgname-$pkgver

  # Ensuring all STLSoft C source files are in UNIX format
  SAVEIFS=$IFS
  IFS=$'\n'
  find $srcdir/$pkgname-$pkgver/include -iname '*.h*' | while read f ; do \
    set -e ; sed -i 's/\x0D$//' $f ; \
  done
  IFS=$SAVEIFS

  echo dos2unix.has.been.performed > $srcdir/$pkgname-$pkgver/include/stlsoft/internal/dos2unix.has.been.performed

  cp -r $srcdir/$pkgname-$pkgver/include $pkgdir/usr/include/$pkgname

  install -d "${pkgdir}/etc/profile.d"
  install -d "${pkgdir}/usr/share/licenses/$pkgname"
  install -m755 "${srcdir}/$pkgname.sh" "${pkgdir}/etc/profile.d/" || return 1
  install -D -m644 $srcdir/$pkgname-$pkgver/LICENSE.txt ${pkgdir}/usr/share/licenses/$pkgname/ || return 1
}

# vim:set ts=2 sw=2 et:
