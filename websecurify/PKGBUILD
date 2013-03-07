# Maintainer:  Ebubekir KARUL <ebubekirkarul@yandex.com>
# Contributor: Nassim KACHA <nassim.kacha@blueicefield.com>
pkgname=websecurify
pkgver=1.0.0
pkgrel=1
pkgdesc="A powerful web application security testing environment."
arch=('i686' 'x86_64')
url="http://www.websecurify.com"
license=('GPL')
depends=('xulrunner>=1.9.2.8')
install=websecurify.install
source=(https://websecurify.googlecode.com/files/Websecurify%20Suite%20$pkgver.tar.gz websecurify.desktop)
md5sums=('303daa374f287f6d533639efaa09f20c' '77c6546d21fa7bea58e3e616160fc613')

build() {
   mkdir -p ${pkgdir}/opt
   mkdir -p ${pkgdir}/usr/share/applications
   cp -r "${srcdir}/Websecurify ${pkgver}" ${pkgdir}/opt/websecurify
   cp websecurify.desktop ${pkgdir}/usr/share/applications/
   chmod 644 ${pkgdir}/usr/share/applications/websecurify.desktop
}