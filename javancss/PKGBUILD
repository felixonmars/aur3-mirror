# Contributor: A. Klitzing <andre () incubo () de>
pkgname=javancss
pkgver=32.53
pkgrel=1
pkgdesc="Source Measurement Suite for Java"
arch=('any')
url="http://www.kclee.de/clemens/java/javancss/"
license=('LGPL')
depends=('java-environment>=5')
source=(http://www.kclee.de/clemens/java/javancss/$pkgname-$pkgver.zip $pkgname.sh)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # install profile.d script
  install -dm755 ${pkgdir}/etc/profile.d || return 1
  install -m755 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d/ || return 1

  # install javancss
  install -dm755 ${pkgdir}/usr/share/java/${pkgname}/{bin,lib,xslt,icons,doc} || return 1
  install -m755 bin/javancss ${pkgdir}/usr/share/java/${pkgname}/bin || return 1
  install -m644 lib/*.jar ${pkgdir}/usr/share/java/${pkgname}/lib || return 1
  install -m644 doc/* ${pkgdir}/usr/share/java/${pkgname}/doc || return 1
  install -m644 icons/* ${pkgdir}/usr/share/java/${pkgname}/icons || return 1
  install -m644 xslt/*.xsl ${pkgdir}/usr/share/java/${pkgname}/xslt || return 1
  install -dm755 ${pkgdir}/usr/share/java/${pkgname}/xslt/svg || return 1
  install -m644 xslt/svg/*.xsl ${pkgdir}/usr/share/java/${pkgname}/xslt/svg || return 1
}
md5sums=('0f79a45864f4a55e2b60695f6bb24fc9'
         '0f487f40eeef685005551b2b6ee4fa91')
