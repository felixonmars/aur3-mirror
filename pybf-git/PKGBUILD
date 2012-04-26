# Maintainer: Lightning <sgsdxzy@gmail.com>

pkgname=pybf-git
pkgver=20120426
pkgrel=1
pkgdesc="Pybrainfuck is a brainfuck interpreter written in python"
arch=('i686' 'x86_64')
url=('https://github.com/sgsdxzy/Pybrainfuck')
license=('GPL3')
depends=('python')
options=('!strip')

_gitroot=https://sgsdxzy@github.com/sgsdxzy/
_gitname=Pybrainfuck

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

}
package() {
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/lib/python3.2/
	install -Dm555 "${srcdir}/${_gitname}/pybf.py" "${pkgdir}/usr/bin/pybf"
	install -Dm555 "${srcdir}/${_gitname}/brainfuck.py" "${pkgdir}/usr/lib/python3.2/brainfuck.py"
}
