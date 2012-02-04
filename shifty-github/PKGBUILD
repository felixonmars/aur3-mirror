# Maintainer: Anton S <fluffylime at gmail dot com>
pkgname=shifty-github
pkgver=20111122
pkgrel=1
pkgdesc="Dynamic tagging library for Awesome window manager, bioe007's fork"
arch=("i686" "x86_64")
url="http://awesome.naquadah.org/wiki/Shifty"
license=("unknown")
depends=("awesome")
makedepends=("git")
conflicts=("shifty", "shifty-git")
provides=("shifty")
install="${pkgname}.install"

_gitroot=git://github.com/bioe007/awesome-shifty.git
_gitname=shifty

build() {
  cd "${srcdir}"

# Update the library
  msg "Connecting to GIT server...."
  if [[ -d "${_gitname}" ]]; then
      (cd "${_gitname}" && git pull origin)
      msg "The local files are updated."
  else
      git clone "${_gitroot}" "${_gitname}"
  fi
  msg "GIT checkout done or server timeout"
}

package() {
  # Install the library
  install -d "${pkgdir}/usr/share/awesome/lib/${_gitname}"
  install -m644 "${_gitname}/init.lua" "${pkgdir}/usr/share/awesome/lib/${_gitname}/init.lua"

  # Install the doc
  install -d "${pkgdir}/usr/share/doc/awesome/${_gitname}/"
  install -m644 "${_gitname}/README.md" "${pkgdir}/usr/share/doc/awesome/${_gitname}/README.md"
  install -m644 "${_gitname}/example.rc.lua" "${pkgdir}/usr/share/doc/awesome/${_gitname}/example.rc.lua"
}
