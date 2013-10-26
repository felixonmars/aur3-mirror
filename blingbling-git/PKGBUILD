# Contributor: Zsolt Udvari <udvzsolt@gmail.com>

pkgname=blingbling-git
pkgver=20131022
pkgrel=1
pkgdesc="Graphical widget library for Awesome Windows Manager."
arch=("any")
url="http://awesome.naquadah.org/wiki/Blingbling"
license=("GPL2")
depends=("awesome" "lua-oocairo")
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
      git clone "${_gitroot}" "${_gitname}"
      msg "The remote repository was cloned."
  fi
  msg "GIT sync done or server timeout."
}

package () {

  install -d ${pkgdir}/usr/share/awesome/lib/${_gitname}
  install -m644 ${srcdir}/${_gitname}/*.lua ${pkgdir}/usr/share/awesome/lib/${_gitname}

  install -d ${pkgdir}/usr/share/doc/${_gitname}/modules
  install -m644 ${srcdir}/${_gitname}/{README.md,To_Do} ${pkgdir}/usr/share/doc/${_gitname}
  install -m644 ${srcdir}/${_gitname}/.udisks-glue.conf ${pkgdir}/usr/share/doc/${_gitname}/udisks-glue.conf

  install -d ${pkgdir}/usr/share/licenses/${_gitname}
  install -m644 ${srcdir}/${_gitname}/LICENSE ${pkgdir}/usr/share/licenses/${_gitname}
}
