# Maintainer: Erdbeerkaese <erbeerkaese underscore arch at yahoo dot de>

pkgname=starfarer
pkgver=0.54a_RC5
pkgrel=1
pkgdesc="A single-player sandbox style space role-playing game with strategic elements."
arch=('i686' 'x86_64')
url="http://fractalsoftworks.com/"
license=('custom')
depends=('java-runtime' 'openal' 'bash')
install='starfarer.install'
source=(
http://s3.amazonaws.com/fractalsoftworks/starfarer/release/starfarer_linux-${pkgver//_/-}.zip
http://www.fractalsoftworks.com/starfarer/docs/StarfarerManual.pdf
starfarer.sh
starfarer.desktop)
md5sums=('1ea4d87f31e62f2bd1c06c4aef3072dc'
         'd677fdea9b9e8c42e6407e2d739be4f8'
         '95f10ff4a06e27901c02e1054ab661b2'
         '8f34b524db75095cccbd46f0a630d1de')
package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/${pkgname} \
    ${pkgdir}/usr/share/doc/${pkgname} \
    ${pkgdir}/usr/share/java/${pkgname} \
    ${pkgdir}/usr/lib/${pkgname}
  install -Dm644 StarfarerManual.pdf \
    ${pkgdir}/usr/share/doc/${pkgname}
  install -Dm644 ${pkgname}/*.jar ${pkgdir}/usr/share/java/${pkgname}
  if [[ "$CARCH" == x86_64 ]]; then
    install -Dm644 ${pkgname}/native/linux/*64.so \
      ${pkgdir}/usr/lib/${pkgname}/
  else
    install -Dm644 ${pkgname}/native/linux/*[!"64"].so \
      ${pkgdir}/usr/lib/${pkgname}/
  fi
  cp -R ${pkgname}/data ${pkgname}/graphics ${pkgname}/sounds \
    ${pkgdir}/usr/share/${pkgname}/
  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${pkgname}/LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
