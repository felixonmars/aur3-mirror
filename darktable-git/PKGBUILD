# Maintainer:  Christian Himpel <chressie at gmail dot com>
# Contributor: Johannes Hanika  <hanatos at gmail dot com>
# Contributor: Kevin Brubeck Unhammer <unhammer at member dot fsf dot org>
# Contributor: orbisvicis <orbisvicis at gmail dot com>

pkgname=darktable-git
pkgrel=1
pkgver=20111202
pkgdesc="A virtual lighttable and darkroom for photographers"
arch=(i686 x86_64)
url=http://darktable.sourceforge.net/
license=(GPL3)
depends=(sqlite3 gconf hicolor-icon-theme desktop-file-utils lcms2 lensfun
	 exiv2 openexr librsvg libgphoto2 sdl mesa libgnome-keyring flickcurl)
makedepends=(git intltool cmake)
optdepends=()
provides=(darktable)
conflicts=(darktable)
backup=()
options=(!emptydirs)
install=darktable.install
source=(darktable.install)
md5sums=(b1d1f094aec82e7b6eaeaba1e961a074)

_gitroot=git://darktable.git.sf.net/gitroot/darktable/darktable
_gitname=darktable

build() {
  local _gitdir="${srcdir}/${_gitname}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitdir}/.git" ]]; then
    cd "${_gitdir}" && git pull
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitdir}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "${_gitdir}"
  git clean -dfx
  git reset --hard
  [[ ! -d build ]] && mkdir build
  cd build

  cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_USERMANUAL=False \
      -DDONT_INSTALL_GCONF_SCHEMAS=True \
      -DUSE_GCONF_BACKEND=True \
      ..
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install

  # Attribute versioning information to the documentation
  mv "${pkgdir}/usr/share/doc/darktable" "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}"

  # Move "darktable.schemas" to "usr/share/gconf/schemas/" (standard location for Arch Linux)
  # letting makepkg/emptydirs delete the now-empty previous schemas directory
  mkdir -p "${pkgdir}/usr/share/gconf/schemas/"
  mv "${pkgdir}/etc/gconf/schemas/darktable.schemas" "${pkgdir}/usr/share/gconf/schemas/"
}
