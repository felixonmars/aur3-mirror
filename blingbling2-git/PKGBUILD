# Contributor: Jan Bader <jan@javil.eu>
# Based on: blingbling-git By: Zsolt Udvari <udvzsolt@gmail.com>

pkgname=blingbling2-git
pkgver=20120419
pkgrel=1
pkgdesc="Graphical widget library for awesome-git."
arch=("any")
url="http://awesome.naquadah.org/wiki/Blingbling"
license=("GPL2")
depends=("awesome-git" "lua-oocairo")
makedepends=("git")
changelog=$pkgname.changelog

_gitroot=git://github.com/cedlemo/blingbling.git
_gitname=blingbling

build() {
  cd "${srcdir}"

# Download or update the library
  msg "Connecting to GIT server over HTTP..."
  if [[ -d "${_gitname}" ]]; then
      (cd "${_gitname}" && git pull origin)
      msg "The local repository was updated."
  else
      git clone "${_gitroot}" -b v2.0 "${_gitname}"
      msg "The remote repository was cloned."
  fi
  msg "GIT sync done or server timeout."

  [ -d ${srcdir}/${_gitname}/examples_of_rc.lua ] && mv ${srcdir}/${_gitname}/examples{_of_rc.lua,}
  install -d ${pkgdir}/usr/share/awesome/lib/${_gitname}
  install -m644 ${srcdir}/${_gitname}/*.lua ${pkgdir}/usr/share/awesome/lib/${_gitname}
  cp -r ${srcdir}/${_gitname}/wibox ${pkgdir}/usr/share/awesome/lib/${_gitname}

  install -d ${pkgdir}/usr/share/doc/${_gitname}/modules
  install -m644 ${srcdir}/${_gitname}/README ${pkgdir}/usr/share/doc/${_gitname}
  install -m644 ${srcdir}/${_gitname}/.udisks-glue.conf ${pkgdir}/usr/share/doc/${_gitname}/udisks-glue.conf
  install -m644 ${srcdir}/${_gitname}/luadoc.css ${pkgdir}/usr/share/doc/${_gitname}
  install -m644 ${srcdir}/${_gitname}/modules/*.html ${pkgdir}/usr/share/doc/${_gitname}/modules
  cp -r ${srcdir}/${_gitname}/examples ${pkgdir}/usr/share/doc/${_gitname}

  install -d ${pkgdir}/usr/share/licenses/${_gitname}
  install -m644 ${srcdir}/${_gitname}/LICENCE ${pkgdir}/usr/share/licenses/${_gitname}
}
