# Maintainer: Alexandre Chataignon <alexandre@xouillet.info>

pkgname=delightful-git
pkgver=20111101
pkgrel=2
pkgdesc="A set of widgets for Awesome window manager"
arch=("i686" "x86_64")
url="http://solitudo.net/software/awesome/delightful/"
license=("GPL2")
depends=("awesome" "vicious-git" "awesome-freedesktop-git")
makedepends=("git")
optdepends=("gnome-icon-theme: for the icons"
            "libgweather: for the weather widget"
            "luasocket: for the weather widget"
            "luasec: for the weather widget"
            "luaexpat: for the weather widget"
           )

_gitroot=git://scm.solitudo.net/delightful.git
_gitname=delightful


build() {
  cd "${srcdir}"

# Download or update the library
  msg "Connecting to GIT server over HTTP..."
  if [[ -d "${_gitname}" ]]; then
      (cd "${_gitname}" && git pull origin)
      msg "The local repository was updated."
  else
      git clone "${_gitroot}" "${_gitname}"
      msg "The remote repository was cloned."
  fi
  msg "GIT sync done or server timeout."

  msg "Cloning submodules."
  cd "${_gitname}"

  git submodule init
  git submodule update

  msg "Finished cloning repos"
}

package() {

# Install the delightful library
  install -d "${pkgdir}/usr/share/awesome/lib/${_gitname}" || return 1
  install -m644 "${_gitname}/delightful/utils.lua" "${pkgdir}/usr/share/awesome/lib/${_gitname}/" || return 1

# Install the delightful widgets
  install -d "${pkgdir}/usr/share/awesome/lib/${_gitname}/widgets" || return 1
  install -m644 "${_gitname}/delightful/widgets/"*.lua "${pkgdir}/usr/share/awesome/lib/${_gitname}/widgets" || return 1

# Install the librairies needed by the widgets
  install -m644 "${_gitname}/calendar2.lua" "${pkgdir}/usr/share/awesome/lib/" || return 1
  install -m644 "${_gitname}/submodules/metar/src/metar.lua" "${pkgdir}/usr/share/awesome/lib/" || return 1
  install -m644 "${_gitname}/submodules/weatherlib/src/weatherlib.lua" "${pkgdir}/usr/share/awesome/lib/" || return 1
  install -m644 "${_gitname}/submodules/imap/lua/imap.lua/imap.lua" "${pkgdir}/usr/share/awesome/lib/" || return 1

# Install the documentation
  install -d "${pkgdir}/usr/share/doc/awesome/${_gitname}/" || return 1
  install -m644 "${_gitname}/README.mdwn" "${pkgdir}/usr/share/doc/awesome/${_gitname}/" || return 1
  install -m644 "${_gitname}/README.txt" "${pkgdir}/usr/share/doc/awesome/${_gitname}/" || return 1
}
