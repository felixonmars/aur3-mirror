# Mantainer: said

pkgname=jcatgui
pkgver=1.6.1
pkgrel=1
pkgdesc='An application written to solve jobs or rather to earn credits on captcha.trader in more comfortable way than in a browser.'
arch=('any')
url='http://sites.google.com/site/${pkgname}/'
license=('?')
depends=('java-runtime')
source=('http://goo.gl/KiJwQ'
	'notify.wav'
        'jcatgui.desktop'
	'jcatgui.png')

md5sums=('ede2b5948bf5768a91fcb9a8bcaff9f6'
         '73bbae9aa821442121b423d32cacdc70'
         '59fca6246442875bead53cd918c1f461'
         'a4f5f45962d237882135aa652cbd5418')


package() {
  install -Dm755 ${srcdir}/jCatGUI.jar ${pkgdir}/usr/share/${pkgname}/jCatGUI.jar
  install -Dm644 ${srcdir}/notify.wav ${pkgdir}/usr/share/${pkgname}/notify.wav
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${srcdir}/${pkgname}.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
} 
