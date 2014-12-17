# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Barton Cline <barton@bcdesignswell.com>
# Contributor: Dominic Werner <aka.vince@gmail.com>
# Contributor: Jonathan Lestrelin <zanko@daemontux.org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=monodevelop-git
pkgver=5.8.r32685.3ed5eac
pkgrel=1
pkgdesc='An IDE with support for Mono, C, C++, Vala, Java, Python...'
arch=('any')
url='http://www.monodevelop.com'
license=('GPL')
depends=('desktop-file-utils' 'gnome-sharp' 'mono' 'mono-addins')
makedepends=('git' 'nuget-cert')
provides=('monodevelop')
conflicts=('monodevelop')
install='monodevelop.install'
source=('git+https://github.com/mono/monodevelop.git')
sha256sums=('SKIP')

pkgver() {
  cd monodevelop

  _ver="$(cat version.config | grep '^Version=' | sed 's/.*=//')"
  printf "%s.r%s.%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd monodevelop

  git submodule update --init --recursive
}

build() {
  cd monodevelop

  ./configure \
    --prefix='/usr' \
    --profile='stable'
  LD_PRELOAD="" make
}

package() {
  cd monodevelop

  LD_PRELOAD="" make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/share/mime
}

# vim: ts=2 sw=2 et:
