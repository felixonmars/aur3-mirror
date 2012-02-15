# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgbase=nwn-nwmovies-patched
pkgname=nwn-nwmovies-patched
arch=("i686" "x86_64")
pkgdesc="Movie support for Neverwinter Nights, heavily simplified version."
pkgver=20090223.080954
pkgrel=2
license=("custom")
url="http://home.roadrunner.com/~nwmovies/nwmovies/"
depends=("nwn" "elfutils" "sdl" "mplayer" "bash")
makedepends=("perl")
[ "x$CARCH" = "xx86_64" ] && pkgname="lib32-nwn-nwmovies-patched"
[ "x$CARCH" = "xx86_64" ] && depends=("nwn" "lib32-elfutils" "lib32-sdl" "mplayer" "bash")
[ "x$CARCH" = "xx86_64" ] && makedepends+=("gcc-multilib" "elfutils" "sdl")
[ "x$CARCH" = "xx86_64" ] && provides=("nwn-nwmovies-patched" "lib32-nwn-nwmovies")
[ "x$CARCH" = "xx86_64" ] && conflicts=("nwn-nwmovies-patched" "lib32-nwn-nwmovies")
source=("http://home.roadrunner.com/~nwmovies/nwmovies/nwmovies-v4-public.${pkgver}.tar.gz"
        "80-nwmovies.conf"
        "20-nwmovies.sh"
        "nwmovies.patch"
        "mplayer.conf")
md5sums=('1698a83bce2050174670e30c42b9d673'
         '58b1f03ebc816ce67d0d151e6f1c8f87'
         '832c5f763741082d830353a29f5853f0'
         '5a7b51dd8fb8b2f3b833bda6e8702d62'
         'd2fba777fc60ba2bcd9d4109fecec6cb')

build() {
  cd "${srcdir}"
  patch -Np1 -i "nwmovies.patch"
  ./nwmovies_install.pl build
}

package() {
  install -Dm644 "nwmovies/nwmovies.so" "${pkgdir}/opt/nwn/nwmovies/nwmovies/nwmovies.so"
  install -Dm644 "nwmovies/libdis/libdisasm.so" "${pkgdir}/opt/nwn/nwmovies/nwmovies/libdis/libdisasm.so"
  install -Dm644 "mplayer.conf" "${pkgdir}/opt/nwn/nwmovies/movies/mplayer.conf"
  install -Dm755 "nwplaymovie" "${pkgdir}/opt/nwn/nwmovies/nwplaymovie"
  install -Dm644 "nwmovies/nwmovies.README.txt" "${pkgdir}/usr/share/licenses/${pkgname}/readme.txt"
  install -Dm644 "80-nwmovies.conf" "${pkgdir}/etc/nwn/branches.d/80-nwmovies.conf"
  install -Dm644 "20-nwmovies.sh" "${pkgdir}/etc/nwn/hooks.d/20-nwmovies.sh"
}
