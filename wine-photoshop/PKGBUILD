# Maintainer: David Manouchehri <d@32t.ca>

pkgname=wine-photoshop
pkgver=0
pkgrel=1
arch=('i686' 'x86_64')
license=(LGPL)
url="http://www.winehq.com"
pkgdesc="A compatibility layer for running Windows programs, patched for Photoshop"
source=(PKGBUILD_stock::https://projects.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/wine
        30-win32-aliases.conf::https://projects.archlinux.org/svntogit/community.git/plain/trunk/30-win32-aliases.conf?h=packages/wine
        wine.install::https://projects.archlinux.org/svntogit/community.git/plain/trunk/wine.install?h=packages/wine
        PKGBUILD.patch)
sha512sums=('SKIP' 'SKIP' 'SKIP' 'c1e4744466ab83f300e6f458e0bebd5672e848700a0c28d488f1b9c9d594f3206141165a62c74e361fb5be5e25a62440a261d093e06c541e7479fc8c42bfa318') # These are going to get checked later anyway

prepare() {
  printf "Make sure to clean the sources directory otherwise the build may fail\n"
  printf "Patching...\n"  
  cp "${srcdir}/PKGBUILD_stock" "${srcdir}/PKGBUILD_temp"
  patch "${srcdir}/PKGBUILD_temp" "${srcdir}/PKGBUILD.patch" -o "${srcdir}/PKGBUILD_new"
  rm "${srcdir}/PKGBUILD_temp"
  sed -i 's/pkgname/_pkgname/g;s/__pkgname/_pkgname/g;s/_pkgname=wine-photoshop/pkgname=wine-photoshop/g' "${srcdir}/PKGBUILD_new"
  mv "${srcdir}/30-win32-aliases.conf" ../
  mv "${srcdir}/wine.install" ../
  mv "${srcdir}/PKGBUILD_new" ../PKGBUILD
  printf "Please run makepkg again to build\n"
  exit 1
}
