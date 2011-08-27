# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=afsp
pkgver=v9r0
pkgrel=1
pkgdesc="Audio file utility programs and a library of routines for audio files."
arch=('i686' 'x86_64')
url="http://www-mmsp.ece.mcgill.ca/Documents/Software/Packages/AFsp/AFsp.html"
license=('custom')
depends=('glibc')
source=("http://www-mmsp.ece.mcgill.ca/Documents/Downloads/AFsp/AFsp-$pkgver.tar.gz" "LICENSE")
md5sums=('1542de2ad2bcfa694d42f5e74f36cb59'
         '04c4ad8c03644d1ce8790512fb0b7b03')

package() {
  #SRC File permissions are set wrong, changed for pacman to be able to "cd" into the build dir and compile 
  chmod -R a+rw $srcdir/AFsp-$pkgver

  cd "${srcdir}/AFsp-${pkgver}"
  install -d ${pkgdir}/usr/share/licenses/${pkgname}

  make

  make prefix=/usr \
       libdir=${pkgdir}/usr/lib/ \
       datadir=${pkgdir}/usr/share \
       includedir=${pkgdir}/usr/include \
       mandir=${pkgdir}/usr/share/man \
       bindir=${pkgdir}/usr/bin install

install -Dm644 ${srcdir}/LICENSE \
	${pkgdir}/usr/share/licenses/${pkgname}/

#Fix File permissions
chmod 644 $pkgdir/usr/lib/{libtsplite.a,libAO.a}

}

# vim:set ts=2 sw=2 et:
