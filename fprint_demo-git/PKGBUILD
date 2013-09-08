# Maintainer: Dreieck

_pkgname="fprint_demo"
pkgname="${_pkgname}-git"
pkgver=latest
pkgrel=5
pkgdesc="A simple GTK+ application to demonstrate and test libfprint's capabilities"
arch=("i686" "x86_64")
url="http://www.freedesktop.org/wiki/Software/fprint/fprint_demo/"
license=(GPL2)
depends=(libfprint gtk2 hicolor-icon-theme)
provides=("${_pkgname}=${pkgver}")
replaces=("${_pkgname}<=${pkgver}")
conflicts=("${_pkgname}")
groups=(fprint)
options=(!libtool !emptydirs)
source=(
        "https://github.com/dsd/${_pkgname}/archive/master.zip"
        "fprint_demo.install"
       )
install="fprint_demo.install"
sha256sums=(
            'SKIP'
            '112316032c9da7a01bedd139e17f2aa1ea4a8a309fedb08789c2bd05d3a3f836'
           )

build() {
  cd "${_pkgname}-master"
  
  _configopts=(
               '--prefix=/usr'
               '--sysconfdir=/etc'
               "--docdir=/usr/share/doc/${_pkgname}"
              )
  
  msg "Running './autogen.sh'..."
  ./autogen.sh "${_configopts[@]}"
  msg "...'autogen.sh' ran."
  
  msg "Running './configure'..."
  ./configure "${_configopts[@]}"
  msg "...'./configure' ran."
  
  msg "Running 'make'..."
  make
  msg "...'make' ran."
}

package() {
  cd "${_pkgname}-master"
  
  _bininstdir="${pkgdir}/usr/bin"
  _docinstdir="${pkgdir}/usr/share/doc/${_pkgname}"
  
  msg "Installing icons and desktop files..."
  make DESTDIR="${pkgdir}" install
  msg "...icon and desktop files installed."
  
  msg "Installing binary..."
  install -v -d "${_bininstdir}"
  install -v -m 755 "src/fprint_demo" "${_bininstdir}/fprint_demo"
  msg "...binary installed."
  
  msg "Installing doc files..."
  install -v -d "${_docinstdir}"
  for _docfile in "README" "INSTALL" "NEWS" "AUTHORS"; do
    install -v -m 644 "${_docfile}" "${_docinstdir}/${_docfile}"
  done
  msg "...doc files installed."
}

