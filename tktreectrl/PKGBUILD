pkgname=tktreectrl
# Maintainer: Mihai Militaru <mihai dot militaru at xmpp dot ro>
# Contributor: Foucault <foucault.online@gmail.com>

pkgver=2.4.1
pkgrel=1
_tkver=8.6.0
pkgdesc="A flexible listbox widget for Tk."
arch=('i686' 'x86_64') 
url="http://tktreectrl.sourceforge.net/"
license=('custom')
depends=('tcl' 'tk' 'libx11')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
"http://downloads.sourceforge.net/sourceforge/tcl/tk${_tkver}-src.tar.gz")
sha1sums=('5cd7bdfd81ba8a9faf3d842ed96f5f448111a1c9'
          'c42e160285e2d26eae8c2a1e6c6f86db4fa7663b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  if [ "$CARCH" = "x86_64" ]; then
    ./configure --prefix=/usr --enable-threads --enable-64bit
  else
    ./configure --prefix=/usr --enable-threads --disable-64bit
  fi
 
  sed -i \
  "s#-I\"/usr/include\" -I\"/usr/include\"#\
  -I\"/usr/include\" -I\"../tk${_tkver}/generic\" -I\"../tk${_tkver}/unix\"#\
  g" Makefile

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  make DESTDIR=${pkgdir} install

  mkdir -p ${pkgdir}/usr/share/doc/tktreectrl
  mv ${pkgdir}/usr/lib/treectrl${pkgver}/htmldoc ${pkgdir}/usr/share/doc/tktreectrl/

  # install license
  install -Dm644 license.terms ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
