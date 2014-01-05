# $Id: PKGBUILD 102297 2013-12-07 12:05:54Z lcarlier $
# Maintainer: Andrey Korobkov <korobkov@fryxell.info>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>


pkgname=openttd-yapp
_openttd_ver=1.3.2
_openttd_name=openttd-${_openttd_ver}
pkgver=DC3.0RC3
pkgrel=1
pkgdesc='Yet Another Patch Pack based on YACD (for OpenTTD)'
arch=('i686' 'x86_64')
url='http://www.tt-forums.net/viewtopic.php?f=33&t=65525'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo2' 'hicolor-icon-theme' 'desktop-file-utils' 'xz')
install=openttd.install
optdepends=('openttd-opengfx: free graphics'
            'openttd-opensfx: free soundset')
source=("http://binaries.openttd.org/releases/${_openttd_ver}/${_openttd_name}-source.tar.xz"
	"${_openttd_name}-${pkgver}.diff.gz")
sha512sums=('a325d7ba521aac67c9d50c672054359fd0522d7bba066da1ef370ee78d8b8dd570375423bc6e8ee6468b931ae57e85559607037547ea56415ac3f113736d386b'
            '62f3e3d91ec9da36e2cb91bbf0bb8ac979c65875933f3731f0073882d26faf077332d2438f713cafe6cb4232134743892a16a5a6e64dfbc34f6d1bce7649d4a9')

package() {
  patch -p0 -i ${srcdir}/${_openttd_name}-${pkgver}.diff


  cd ${_openttd_name}

 ./configure \
    --prefix-dir=/usr \
    --binary-name=${pkgname} \
    --binary-dir=bin \
    --data-dir=share/${pkgname} \
    --install-dir=${pkgdir} \
    --doc-dir=share/doc/${pkgname} \
    --menu-name="OpenTTD-YAPP" \
    --personal-dir=.${pkgname}

  make
  make install
}
