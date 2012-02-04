# Mantainer: William Daz <wdiaz [at] archlinux [dot] us>
# Contributor: Joao Rodrigues <gothicknight@gmail.com>
# 29.12.09: Updated by Arlekino <arlekino.zirk@gmail.com>

pkgname=swiftweasel-athlon64
_pkgname=swiftweasel
pkgver=3.5.6
pkgrel=1
pkgdesc="Mozilla Firefox optimized build for AMD 64-bit processors (32 and 64 bit versions)."
arch=('i686' 'x86_64')
url="http://swiftweasel.sf.net/"
license=('MPL' 'GPL' 'LGPL')
depends=('nss' 'mozilla-common' 'desktop-file-utils' 'libidl2' 'libxcomposite' 'xulrunner' 'nspr')
conflicts=()
provides=(firefox)

if [ "${CARCH}" == 'i686' ]; then 
source=(http://download.tuxfamily.org/${_pkgname}/${_pkgname}-35/${pkgver}-tar.gz/${_pkgname}-${pkgver}_amd-pgo_x86-arch.tar.gz
        swiftweasel.desktop
        swiftweasel-safe.desktop)
md5sums=('f76655ee8328af578d4e49577dda13da'
         'e02fc1051ff31e05e45ec99eb38e16f6'
         'eef46b6617fb0dab69037c122793c6fb')
elif  [ "${CARCH}" == 'x86_64' ]; then
source=(http://download.tuxfamily.org/${_pkgname}/${_pkgname}-35/${pkgver}-tar.gz/${_pkgname}-${pkgver}_amd-pgo_x86_64-arch.tar.gz
        swiftweasel.desktop
        swiftweasel-safe.desktop)
md5sums=('5f4d83122f2686d65c91c67191f0f378'
         'e02fc1051ff31e05e45ec99eb38e16f6'
         'eef46b6617fb0dab69037c122793c6fb')
fi

build() {

  install -dv $pkgdir/{opt,usr/bin}
  cp -r $srcdir/swiftweasel $pkgdir/opt
  ln -s /opt/swiftweasel/swiftweasel /$pkgdir/usr/bin/swiftweasel

  ## Fix error install.rdf
  chmod -R 755 ${pkgdir}/opt/${_pkgname}/extensions/*

  install -m644 -Dv $srcdir/swiftweasel/icons/mozicon128.png \
	$pkgdir/usr/share/pixmaps/swiftweasel.png || return 1
  install -m644 -Dv $srcdir/swiftweasel.desktop \
	$pkgdir/usr/share/applications/swiftweasel.desktop || return 1
  install -m644 -v $srcdir/swiftweasel-safe.desktop \
	$pkgdir/usr/share/applications/ || return 1
}
