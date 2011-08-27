# $Id: PKGBUILD 26100 2010-09-13 15:56:15Z schuay $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Fubar

pkgname=adesklets-posixsignal
name=adesklets
provides=adesklets
conflicts=adesklets
pkgver=0.6.1
pkgrel=11
pkgdesc="An imlib2-based system to have interactive 'desklets' - patched to not crash with posixsignal error."
arch=('i686' 'x86_64')
url="http://adesklets.sourceforge.net/"
license=('GPL2')
depends=('imlib2' 'fontconfig' 'python2' 'perl' 'ttf-bitstream-vera' 'libx11')
install=$name.install
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/${name}/${name}-${pkgver}.tar.bz2 \
        fontconfig-2.4.patch \
	posix_signal.patch)

md5sums=('cd390c9398449c5566033e2e4792bccb'
         '0374aec97670c90713fcabc2710e2160'
	'eeac3e0ccf6cc4ea087092b85a36c0d4')

build() {
  cd ${srcdir}/${name}-${pkgver}

  #patch for fontconfig => 2.4
  patch -Np0 -i ${srcdir}/fontconfig-2.4.patch
  patch -Np0 -i ${srcdir}/posix_signal.patch
  autoreconf
  ./configure --prefix=/usr

  #makefile Fix
  sed -i 's/\/bin\/sh//' doc/Makefile

  #python2 fix
  for file in checkin installer submit; do
      sed -i 's_/usr/bin/env python_/usr/bin/env python2_' utils/${name}_${file}
  done

  make
}
package() {
  cd ${srcdir}/${name}-${pkgver}

  make DESTDIR=${pkgdir} INSTALLDIRS=vendor install

  rm ${pkgdir}/usr/share/info/dir

  #remove the font stuff
  rm -f ${pkgdir}/usr/share/adesklets/{FONT_LICENSE,Vera.ttf}

  find ${pkgdir} -name '.packlist' -exec rm  '{}' \;
  find ${pkgdir} -name 'perllocal.pod' -exec rm  '{}' \;
}
