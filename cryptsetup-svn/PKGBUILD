# $Id: PKGBUILD 129976 2011-06-30 17:57:50Z thomas $
# Contributor: Thomas Bächler <thomas@archlinux.org> (core package)
# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=cryptsetup-svn
pkgver=671
pkgrel=1
pkgdesc="Userspace setup tool for transparent encryption of block devices using the Linux 2.6 cryptoapi - svn version"
arch=(i686 x86_64)
license=('GPL')
url="http://code.google.com/p/cryptsetup/"
groups=('base')
depends=('device-mapper>=2.02.85-2' 'libgcrypt' 'popt')
conflicts=('mkinitcpio<0.7' 'cryptsetup')
provides='cryptsetup'
options=('!libtool' '!emptydirs')
source=(encrypt_hook
	encrypt_install)
_svnmod="${pkgname}"
_svntrunk="http://cryptsetup.googlecode.com/svn/trunk/"

build() {
  cd ${srcdir}

  msg "Connecting to SVN server...."

  if [ -d ${_svnmod}/.svn ]; then
	  (cd ${_svnmod} && svn up -r $pkgver)
  else
	  svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  svn export ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  cd ${srcdir}/${pkgname}-build
  ./autogen.sh
  ./configure --prefix=/usr --disable-static --sbindir=/sbin --libdir=/lib
  make
}

package() {
  cd ${srcdir}/${pkgname}-build
  make DESTDIR=${pkgdir} install
  # install hook
  install -D -m644 ${srcdir}/encrypt_hook ${pkgdir}/lib/initcpio/hooks/encrypt
  install -D -m644 ${srcdir}/encrypt_install ${pkgdir}/lib/initcpio/install/encrypt
  # Fix pkgconfig location
  install -d -m755 ${pkgdir}/usr/lib
  mv ${pkgdir}/lib/pkgconfig ${pkgdir}/usr/lib/
}

md5sums=('14eb7d5f374b7a6ca06734418f71b777'
         '611823be1d92aedeb119be41c8cf1914')
