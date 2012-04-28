# Maintainer <phoenixlzx [at] archlinuxcn.org

pkgname=drcom-client
pkgver=1.0.0d
pkgrel=1
pkgdesc="Authentication client for Dr.COM network service"
url="http://www.doctorcom.com/"
arch=('x86_64' 'i686')
license=('Other')
install="drcom.install"
source=("http://www.seainsight.me/res/DrClient.tar.gz" "drlogo.png" "drcom.desktop")
md5sums=('a58c6fdab63c25b3a5caf3b19759f64e' '65bb9f2cda59ca7c158bdeb750e8eca5' 'c70a8964fd58f9ce4cf7e9ec3879cc82')

if [ "${CARCH}" = 'x86_64' ]; then
  depends=('lib32-libsm' 'lib32-libice' 'lib32-libxi' 'lib32-libxrender' 'lib32-libxrandr' 'lib32-libxcursor' 'lib32-libxinerama' 'lib32-freetype2' 'lib32-fontconfig' 'lib32-libxext' 'lib32-libx11' 'lib32-zlib' 'lib32-glibc' 'lib32-gcc-libs')
else	
  depends=('libsm' 'libice' 'libxi' 'libxrender' 'libxrandr' 'libxcursor' 'libxinerama' 'freetype2' 'fontconfig' 'libxext' 'libx11' 'zlib' 'glibc' 'gcc-libs')
fi

package() {
  install -d ${pkgdir}/opt/
  cp -r DrClient ${pkgdir}/opt/
  
  install -Dm644 drlogo.png ${pkgdir}/opt/DrClient/drlogo.png
  install -Dm644 drcom.desktop ${pkgdir}/usr/share/applications/drcom.desktop
}
