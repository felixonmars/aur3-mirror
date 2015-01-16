# Maintainer: Andrey Korobkov <korobkov@fryxell.info> (ed25519/15CD12166CE1AA1E)
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>


pkgname=openttd-yapp-git
_pkgname=openttd-yapp
pkgrel=1
pkgdesc='Yet Another Patch Pack based on YACD (for OpenTTD) + bridge signals patch'
arch=('i686' 'x86_64')
url='http://www.tt-forums.net/viewtopic.php?f=33&t=65525'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo2' 'hicolor-icon-theme' 'desktop-file-utils' 'xz')
provides=('openttd-yapp')
conflicts=('openttd-yapp')
install=openttd.install
optdepends=('openttd-opengfx: free graphics'
            'openttd-opensfx: free soundset')
source=("git+https://gitlab.com/korobkov/openttd-yapp.git")
sha512sums=('SKIP')


pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}

  export CFLAGS="${CFLAGS} -fpermissive" # should be fixed in source code to not produce errors

 ./configure \
    --prefix-dir=/usr \
    --binary-name=${_pkgname} \
    --binary-dir=bin \
    --data-dir=share/${_pkgname} \
    --install-dir=${pkgdir} \
    --doc-dir=share/doc/${pkgname} \
    --menu-name="OpenTTD-YAPP" \
    --personal-dir=.${pkgname}

  make
  make install
}
