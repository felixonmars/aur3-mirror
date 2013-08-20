_pkgname=xf86-video-sis671
pkgname=${_pkgname}-git
pkgver=25.38bf667
pkgrel=1
pkgdesc="SiS 671 video driver (derivate of xf86-sisimedia, latest tested version). Module name is 'sisimedia'."
arch=('i686' 'x86_64')
url="https://gitorious.org/${_pkgname}"
license=('custom')
depends=('glibc')
makedepends=('xorg-server-devel>=1.11.0' 'xf86dgaproto' 'libdrm' 'xf86driproto' 'mesa' 'glproto' 'resourceproto')
provides=('xf86-video-sisimedia')
conflicts=('xorg-server<1.13.0' 'xf86-video-sisimedia')
options=()
source=("${_pkgname}::git+git://gitorious.org/xf86-video-sis671/sis-671-fix.git"
        "miPointerSetPosition.patch")
md5sums=('SKIP'
         '68cf2d99212ceecea6e8e87f3d1eca9f')

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"

  patch -i ../miPointerSetPosition.patch -p1

  autoreconf -vi
  ./configure \
	--prefix=/usr \
	--disable-selective-werror \
	--disable-dri
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="$pkgdir/" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}

