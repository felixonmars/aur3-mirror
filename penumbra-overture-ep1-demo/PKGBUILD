# Maintainer:  Eugen Zagorodniy <e dot zagorodniy at gmail dot com>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: gyo <nucleogeek_at_gmail_dot_com>

pkgname=penumbra-overture-ep1-demo
pkgver=2553
pkgrel=2
pkgdesc='First person dark adventure game'
arch=('i686' 'x86_64')
url='http://www.penumbragame.com/demo.php'
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-openal' 'lib32-sdl_ttf' 'lib32-libvorbis' 'lib32-libgl' 'lib32-libxft' 'lib32-mesa' 'desktop-file-utils' 'lib32-sdl_image')
else
	depends=('openal' 'sdl_ttf' 'libvorbis' 'libgl' 'libxft' 'mesa' 'desktop-file-utils' 'sdl_image')
fi
makedepends=('xz')
install="$pkgname.install"
source=("http://www.thedarkswarm.com/downloads/demo/PenumbraOvertureDemo-${pkgver}.sh"
        "${pkgname}.desktop")
md5sums=('dfd6d958c3ef8360577767f320059b76'
         'cec56019df7b2a45f1d6d51c82573ede')
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -e http://www.penumbragame.com/demo.php -o %o %u')

build() {
  cd $srcdir

  case $CARCH in
    i686) rm bin/linux/x86_64 -fr; _arch=x86;;
    x86_64) rm bin/linux/x86 -fr; _arch=x86_64;;
  esac

  mkdir -p $pkgname
  echo "Extracting archive"
  sh PenumbraOvertureDemo-${pkgver}.sh --tar xvf -C $pkgname ./instarchive_all ./config/license
  cd $pkgname
  lzmadec instarchive_all > pack.tar
  echo "...Done."

  mkdir -p ${pkgdir}/opt/
  tar xvf pack.tar -C ${pkgdir}/opt/

  cd ${pkgdir}/opt/PenumbraOvertureDemo

  echo "* Changing owner"
  chown root.root -R .
  echo "...Done"

  mkdir -p ${pkgdir}/usr/share/licenses/$pkgname/
  mkdir -p ${pkgdir}/usr/share/applications/
  install -m644 ${srcdir}/$pkgname/config/license ${pkgdir}/usr/share/licenses/$pkgname/
  install -m644 ${srcdir}/$pkgname.desktop ${pkgdir}/usr/share/applications/

  mkdir -p ${pkgdir}/usr/bin
  echo \#\!/bin/bash > ${pkgdir}/usr/bin/penumbrademo
  echo cd /opt/PenumbraOvertureDemo/>> ${pkgdir}/usr/bin/penumbrademo
  echo ./penumbrademo >> ${pkgdir}/usr/bin/penumbrademo
  chmod +x ${pkgdir}/usr/bin/penumbrademo
}
