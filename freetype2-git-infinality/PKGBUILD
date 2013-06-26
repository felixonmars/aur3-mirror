# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

pkgname=freetype2-git-infinality
pkgver=2.4.99.git20130513
pkgrel=2
_infinality_version=2.4.12
_infinality_release=01
_infinality_date=20130514
pkgdesc="TrueType font rendering library with Infinality patch"
arch=(i686 x86_64)
url="http://www.infinality.net/"
license=('GPL')
depends=('bzip2' 'zlib')
makedepends=('git')
optdepends=('ttf-win7-fonts: (AUR) Fonts included in Windows 7'
            'fontconfig-infinality: (AUR) Infinality configuration files')
provides=("freetype2=$pkgver" "freetype2-infinality=$pkgver")
conflicts=('freetype2' 'freetype2-infinality')
backup=('etc/profile.d/infinality-settings.sh')
options=('!libtool')
install='infinality.install'
source=(git://git.sv.nongnu.org/freetype/freetype2.git#commit=6650be7c43c9f7299a0bfbd5d81b481efbe9d95b
        http://www.infinality.net/fedora/linux/zips/freetype-infinality-${_infinality_version}-${_infinality_date}_${_infinality_release}-x86_64.tar.bz2
        freetype2-enable-valid.patch)
sha256sums=('SKIP'
            '151973c65d9de980df9d39849b38132743ea7c44dcaadca16bfcf3daf7b7e2d1'
            '97751d04014b7f2a42bce3ed99417eeb058563e2b7c94251f05f489666fec5bb')

build() {
  cd "${srcdir}/freetype2"

  # We need to generate the configure script BEFORE applying patches because
  # Infinality patches this script
  sh autogen.sh

  # Apply miscellaneous patches.
  patch -Np0 -i "${srcdir}/freetype2-enable-valid.patch"

  # Apply Infinality patch.
  patch -Np1 -i "${srcdir}/freetype-entire-infinality-patchset-${_infinality_date}-${_infinality_release}".patch

  # Run configure script
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/freetype2"

  make DESTDIR="${pkgdir}" install

  # Install settings file from the freetype-infinality source tarball.
  # freetype-infinality.sh is not installed because LD_PRELOAD isn't neccessary
  # as we are replacing the unpatched freetype2 package.
  install -m 755 -D -T "${srcdir}/infinality-settings.sh" "${pkgdir}/etc/profile.d/infinality-settings.sh"
}

# vim: set ts=2 sw=2 ft=sh noet:
