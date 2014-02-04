# Maintainer: Pyro Devil <p.devil@gmail.com>
pkgname=lightworks
pkgver=11.5
pkgrel=1
pkgdesc="A professional non-linear editing system for editing and mastering digital video in various formats."
url="http://www.lwks.com/"
arch=('x86_64')
license=('custom')
depends=('glu' 'portaudio' 'nvidia-cg-toolkit' 'gtk3' 'ffmpeg' 'ffmpeg-compat' 'libedit' 'libgl' 'libgsf' 'gcc-libs')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("lwks-${pkgver}-amd64.deb")
md5sums=('748a8f916121e282f95ba01020565cd6')
noextract=("lwks-${pkgver}-amd64.deb")
install=

package() {
  bsdtar -xf "lwks-${pkgver}-amd64.deb" data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir}"
	rm data.tar.gz
  
  mv -f "${pkgdir}/lib/udev" "${pkgdir}/usr/lib"
  rmdir "${pkgdir}/lib"
  
  mkdir -p "${pkgdir}/usr/share/licenses/lightworks/"
  mv -f "${pkgdir}/usr/share/doc/lightworks/copyright" "${pkgdir}/usr/share/licenses/lightworks/"
  rm -rf "${pkgdir}/usr/share/doc"
}
