# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Maintainer: Simo Leone <simo@archlinux.org>
pkgname=flite-alsa
pkgver=1.3
pkgrel=1
pkgdesc="A lighweight version of festival speech synthesis - includes Lukas Loehrer's ALSA patch"
arch=(i686 x86_64)
url="http://fife.speech.cs.cmu.edu/flite/"
license=""
provides=('flite')
depends=('glibc' 'alsa-lib>=1.0.10')
source=(http://fife.speech.cs.cmu.edu/flite/packed/$pkgname-$pkgver/$pkgname-$pkgver-release.tar.gz \
http://homepage.hispeed.ch/loehrer/downloads/flite-1.3-alsa_support-1.2.diff.bz2)
md5sums=('ae0aca1cb7b4801f4372f3a75a9e52b5' '5bddab61c3a9928dd5119de4aa8a8881')

build() {
  export MAKEFLAGS="-j1"
  cd $startdir/src/$pkgname-$pkgver-release
  patch -Np0 -i ../flite-1.3-alsa_support-1.2.diff || return 1
  ./configure --prefix=/usr

  #we want the 16k, not 8k voice
  sed -i 's/cmu_us_kal/cmu_us_kal16/' config/config
  
  make || return 1
  
if [ "$CARCH" = "x86_64" ]; then
  #Ugly hack for bad makefile (lib isn't a dir)
  sed -i 's#@ $(MAKE) -C lib --no-print-directory install#$(INSTALL) -m 644 build/x86_64-linux-gnu/lib/*.a $(INSTALLLIBDIR)#g' Makefile
  else   sed -i 's#@ $(MAKE) -C lib --no-print-directory install#$(INSTALL) -m 644 build/i386-linux-gnu/lib/*.a $(INSTALLLIBDIR)#g' Makefile
fi
  make prefix=$startdir/pkg/usr install
}
