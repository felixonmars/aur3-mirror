# Mantainer: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=kdedecor-glowglass-lite
_pkgname=glowglass-lite
pkgver=0.1 
pkgrel=1
pkgdesc="Glowglass-lite is a window decoration for the Aurorae engine."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Glowglass-lite?content=107993"
license=('GPL')
depends=('kdebase-workspace>=4.2.91' 'kdedecor-aurorae')
source=(http://kde-look.org/CONTENT/content-files/107993-${_pkgname}.tar.gz)
md5sums=('c6e0b4103bf92126d18ea956eee16ac9')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/apps/aurorae/themes
  tar xfz glowglass-lite-black.tar.gz; tar xfz glowglass-lite-white.tar.gz
  cp -rf "glowglass-lite-black" "glowglass-lite-white" \
  ${pkgdir}/usr/share/apps/aurorae/themes
}
