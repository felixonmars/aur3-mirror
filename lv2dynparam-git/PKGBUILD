# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
pkgname=lv2dynparam-git
_pkg="${pkgname%-git}"
pkgver=20110930
pkgrel=1
pkgdesc="LV2 plugin interface extension that enables dynamic plugin parameters."
arch=("i686" "x86_x64")
url="http://home.gna.org/lv2dynparam/"
license=("GPL2")
groups=("lv2-plugins")
depends=("glibc" "lv2core")
makedepends=("lv2core")
optdepends=()
options=("!libtool")
source=("gcc-4.6.1.fix.Werror=unused-but-set-variable.patch")
sha256sums=("081b4bbcb14c1ae835a240c79eb45fdede784bc4c6d7a14f2df18d2bd455accb")

_gitroot="git://repo.or.cz/${pkgname/-/.}"
_gitname="$_pkg"

build() {
  local _gitdir="${srcdir}/${_gitname}"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitdir" ]]; then
    cd "$_gitdir" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitdir"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd "$_gitdir"
  git clean -dfx
  git reset --hard HEAD

  #
  # BUILD HERE
  #

  # patch
  #patch -p0 -i "../gcc-4.6.1.fix.Werror=unused-but-set-variable.patch"

  ./bootstrap
  # alternative to patching is compiling without unused-but-set-variable gcc warnings
  CFLAGS="${CFLAGS} -Wno-unused-but-set-variable" ./configure \
    --prefix="/usr" \
    --disable-static
  make
}

package() {
  local _gitdir="${srcdir}/${_gitname}"
  . <(sed -n "s|AC_INIT(\s*\([^[:blank:],]\{1,\}\)\s*,\s*\([^[:blank:],]\{1,\}\)\s*)|_${_pkg^^}_NAME=\1\n_${_pkg^^}_VERSION=\2|p" "${_gitdir}/configure.ac")
  provides=("${_LV2DYNPARAM_NAME,,}=${_LV2DYNPARAM_VERSION}" "${_pkg}=${_LV2DYNPARAM_VERSION}")
  conflicts=("${_LV2DYNPARAM_NAME,,}" "${_pkg}")

  cd "$_gitdir"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
