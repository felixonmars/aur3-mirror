# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=afsp
pkgver=v8r2
pkgrel=2
pkgdesc="Audio file utility programs and a library of routines for audio files."
arch=('i686' 'x86_64')
url="http://www-mmsp.ece.mcgill.ca/Documents/Software/Packages/AFsp/AFsp.html"
license=('custom')
depends=('glibc')
source=(http://www-mmsp.ece.mcgill.ca/Documents/Downloads/AFsp/AFsp-$pkgver.tar.gz LICENSE)
md5sums=('84fbe07c718e076ba61f17c04823dcf5'
         '04c4ad8c03644d1ce8790512fb0b7b03')

build() {
  cd ${srcdir}/AFsp-${pkgver}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  make
  make prefix=/usr libdir=${pkgdir}/usr/lib/ datadir=${pkgdir}/usr/share includedir=${pkgdir}/usr/include mandir=${pkgdir}/usr/share/man bindir=${pkgdir}/usr/bin install
install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
#Permissions are not set to 644 
chmod 644 ${pkgdir}/usr/lib/{libtsp.a,libAO.a}

}

# vim:set ts=2 sw=2 et:
