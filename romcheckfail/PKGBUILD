# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <razielmine@gmail.com>
pkgname=romcheckfail
pkgver=0
pkgrel=2
pkgdesc="A dozen arcade classics carefully placed in a large mixing bowl."
url="http://www.farbs.org/games.html"
arch=('i686')
license=('custom:Farbs')
install=romcheckfail.install
source=(http://games.lastchancemedia.com/farbs/RomCheckFail.sh romcheckfail.desktop)
md5sums=('7ce2746ea0d9f63dc793800c0b37a491' '88907118b4424cd9215a450d35089730')
build() {
  cd $startdir/src/
  sh RomCheckFail.sh --tar xf
  ./bin/linux/x86/libc.so.6/lzma-decode instarchive_all pack.tar

  install -d $pkgdir/opt/$pkgname/ $pkgdir/usr/bin/
  tar xvf pack.tar -C $pkgdir/opt/$pkgname
  #ln -s /opt/$pkgname/RomCheckFail/bin/RomCheckFail $pkgdir/usr/bin/romcheckfail
  echo -e "#!/bin/sh\n/opt/$pkgname/RomCheckFail/bin/RomCheckFail" > $pkgdir/usr/bin/romcheckfail
  chmod 755 $pkgdir/usr/bin/romcheckfail

  install -d $pkgdir/usr/share/applications/
  install -m644 $startdir/src/romcheckfail.desktop $pkgdir/usr/share/applications/

  install -d $pkgdir/usr/share/licenses/$pkgname
  install -m644 $pkgdir/opt/romcheckfail/RomCheckFail/license $pkgdir/usr/share/licenses/$pkgname
}
