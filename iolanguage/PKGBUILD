# Maintainer: mark hellewell <mark.hellewell@gmail.com>

pkgname=iolanguage
pkgver=2010.06.06
pkgrel=1
pkgdesc="A prototype-based programming language inspired by Smalltalk, Self, NewtonScript, Act1, LISP, and Lua."
arch=('i686' 'x86_64')
url="http://iolanguage.com"
license=('BSD')
depends=('glibc')
#make a io.install script to install the addons?
install=iolanguage.install
source=(stevedekorte-io-$pkgver-0-g86b4ee2.tar.gz::http://github.com/stevedekorte/io/tarball/$pkgver)
md5sums=('7968fbe5367aad7a630fc7094be1775b')

build() {
  INSTALL_PREFIX=/usr
  cd $srcdir/stevedekorte-io-86b4ee2
  make vm ${INSTALL_PREFIX} || true
  install -D -m 755 ${srcdir}/stevedekorte-io-86b4ee2/_build/binaries/io ${pkgdir}/${INSTALL_PREFIX}/bin/io || return 1
  install -m 755 ${srcdir}/stevedekorte-io-86b4ee2/_build/binaries/io_static ${pkgdir}/${INSTALL_PREFIX}/bin/io_static || return 1
  install -D -m 644 ${srcdir}/stevedekorte-io-86b4ee2/license/bsd_license.txt ${pkgdir}/usr/share/licenses/io/bsd_license.txt || return 1
  install -D -m 644 ${srcdir}/stevedekorte-io-86b4ee2/_build/lib/libiovmall.a ${pkgdir}/${INSTALL_PREFIX}/lib/libiovmall.a || return 1
  install -m 644 ${srcdir}/stevedekorte-io-86b4ee2/_build/dll/libiovmall.so ${pkgdir}/${INSTALL_PREFIX}/lib/libiovmall.so || return 1

  install -d -m 755 ${pkgdir}/${INSTALL_PREFIX}/share/doc/io || return 1
  cp -R ${srcdir}/stevedekorte-io-86b4ee2/docs/* ${pkgdir}/${INSTALL_PREFIX}/share/doc/io/ || return 1

  install -d -m 755 ${pkgdir}/${INSTALL_PREFIX}/share/io/samples || return 1
  cp -R ${srcdir}/stevedekorte-io-86b4ee2/samples/* ${pkgdir}/${INSTALL_PREFIX}/share/io/samples/ || return 1

  install -d -m 755 ${pkgdir}/${INSTALL_PREFIX}/include/io || return 1
  cp -R ${srcdir}/stevedekorte-io-86b4ee2/_build/headers/* ${pkgdir}/${INSTALL_PREFIX}/include/io/ || return 1

  #convert these raw commands to using 'install' for the addons
  #cp -fR addons ${INSTALL_PREFIX}/lib/io
  #chmod -R ugo+rX ${INSTALL_PREFIX}/lib/io
}
