# Maintainer: flu
# Contributir: chubakur <chubakur@gmail.com>

pkgname=wizards-magic
pkgver=3.2.20
pkgrel=1
pkgdesc="Open Source card strategy, based on rules of Magic: The Gathering."
arch=('i686' 'x86_64')
url="http://code.google.com/p/${pkgname}"
license=('GPL2')
depends=('python2' 'python2-pygame')
source=("http://sourceforge.net/projects/wizards-magic/files/WizardsMagic-${pkgver}.zip" wizards-magic ${pkgname}.desktop wizardsmagic.cfg)

md5sums=(
         '43f0484241bed14aa91eba7f6bdb85a9'
         'c59f22d40498b3cd1255c9a209ca7e06'
         'bf019fd59cc00d95c550640a89554fb5'
         '4f84c09ff8b5985a32dd47aff4cd49d6'
)

package(){
  cd               ${srcdir}
  mkdir   -p       ${pkgdir}/opt/${pkgname} ${pkgdir}/usr/bin
  cp      -r       WizardsMagic/*           ${pkgdir}/opt/${pkgname}/
  install -D -m755 wizards-magic            ${pkgdir}/usr/bin
  install -D -m644 ${pkgname}.desktop       ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -D -m777 wizardsmagic.cfg         ${pkgdir}/opt/${pkgname}/wizardsmagic.cfg
}
