# Maintainer: Philipp Gesang <phg42.2a@gmail.com>

pkgname=luasec-prosody-git
_gitname=luasec
_gitbranch=master
pkgver=42.903efaf
pkgrel=2
pkgdesc="A fork of LuaSec, an SSL and crypto library for Lua."
arch=("i686" "x86_64")
url="https://github.com/brunoos/luasec/wiki"
license=("MIT")
groups=()
depends=("lua" "openssl")
makedepends=("git")
provides=("luasec")
conflicts=("luasec-hg")
#install=
source=("${_gitname}::git+https://github.com/brunoos/${_gitname}#branch=${_gitbranch}")
noextract=()
sha512sums=("SKIP")

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server ..."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build ..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  msg "Rewrite paths in Makefile to build for Lua 5.2"
  sed -i "/^LUAPATH/ cLUAPATH  ?= ${pkgdir}/usr/share/lua/5.2" "Makefile"
  sed -i "/^LUACPATH/cLUACPATH ?= ${pkgdir}/usr/lib/lua/5.2"   "Makefile"

  ## build
  msg "Compile for target \"linux\""
  if [[ "${LDFLAGS}" =~ "-Wl" ]]
  then
    msg "Fixing LDFLAGS (remove \"-Wl\")"
    LDFLAGS=${LDFLAGS/-Wl,/}
    echo "LDFLAGS=\"${LDFLAGS}\""
  fi
  make linux
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}/" install
  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
