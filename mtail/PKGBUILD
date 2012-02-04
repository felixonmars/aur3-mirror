# $Id: PKGBUILD, v 0.1 2011-06-06 11:00:00 chepaz $
# Maintainer: Joeran Zeller aka Chepaz <mx-bounce<@>gmx.de
# Contributor: Joeran Zeller aka Chepaz <mx-bounce<@>gmx.de>
pkgname=mtail
pkgver=1.1.1
pkgrel=1
pkgdesc="A tail replacement with scriptable, colorized, output"
arch=(any)
url="http://matt.immute.net/"
license=('custom')
depends=('python2')
source=(http://matt.immute.net/src/mtail/$pkgname-$pkgver.tgz \
	http://matt.immute.net/src/mtail/mtailrc-syslog.sample
       )
md5sums=('166ccd3bfea04fdc81940b256d7d6f18'
         '6a66666049b399b07dc0b263fdb47b28'
        )

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed '1 s/python/python2/' mtail > mtail_sed
  mv -f mtail_sed ${pkgname}
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  install -d "${pkgdir}"/usr/bin/ "${pkgdir}"/usr/share/doc/mtail/
  
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  
  install -m755 ${pkgname} "${pkgdir}"/usr/bin
  install -m644 CHANGES "${pkgdir}"/usr/share/doc/mtail
  install -m644 LICENSE "${pkgdir}"/usr/share/doc/mtail
  install -m644 README "${pkgdir}"/usr/share/doc/mtail
  install -m644 mtailrc.sample "${pkgdir}"/usr/share/doc/mtail
  install -m644 ${srcdir}/mtailrc-syslog.sample "${pkgdir}"/usr/share/doc/mtail
}
