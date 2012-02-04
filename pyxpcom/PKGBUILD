# Contributor: Tocer Deng <tocer.deng@gmail.com>
# inspire by http://gentoo-overlays.zugaina.org/sugar/portage/dev-python/pyxpcom/pyxpcom-1.9.2.ebuild

pkgname=pyxpcom
pkgver=9.0.1
_pkgtag=21f695a18fe8
pkgrel=1
pkgdesc="Python interface for mozilla XPCOM library"
arch=('i686' 'x86_64')
url="http://developer.mozilla.org/en/PyXPCOM"
license=('GPL2')
groups=()
depends=('python2' 'xulrunner' 'zip')
makedepends=('autoconf2.13')
source=(http://hg.mozilla.org/pyxpcom/archive/$_pkgtag.tar.bz2
        http://gentoo-overlays.zugaina.org/sugar/portage/dev-python/pyxpcom/files/0.87/fc-xpcom-dynstr.patch
       )
md5sums=('ce390f3a6ceb789fc6203255cc048b7a'
         '91af0081ca8b5c508e1617911bef9cda')

build() {
  cd "$srcdir/$pkgname-$_pkgtag"
  patch config/config.mk ../../fc-xpcom-dynstr.patch
  autoconf-2.13 || return 1

  _xulsdkdir="$(pkg-config --variable sdkdir libxul)" 

  [ -d objdir ] && rm -rf objdir
  mkdir objdir || return 1
  cd objdir
  export PYTHON=/usr/bin/python2
  ../configure --with-libxul-sdk=${_xulsdkdir} \
               --with-system-nspr \
               --prefix=/usr \
               --disable-tests \
               --libdir=/usr/lib || return 1
  make || return 1
  
  # Create directories
  install -d $pkgdir/usr/lib/python2.7/site-packages
  install -d ${pkgdir}${_xulsdkdir}/bin
  install -d ${pkgdir}${_xulsdkdir}/include
  install -d ${pkgdir}${_xulsdkdir}/idl
  install -d ${pkgdir}${_xulsdkdir}/sdk/lib
  
  # Copy files
  cp -r dist/bin/python/* $pkgdir/usr/lib/python2.7/site-packages/ || return 1
  cp -r dist/bin/* ${pkgdir}${_xulsdkdir}/bin/ || return 1
  cp -r dist/include/* ${pkgdir}${_xulsdkdir}/include/ || return 1
  cp -r dist/lib/* ${pkgdir}${_xulsdkdir}/sdk/lib/ || return 1
}

# vim:set ts=2 sw=2 et:
