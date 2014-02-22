# Maintainer: veox <veox ta wemakethings dot net>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>

pkgname=openocd-git
_gitname=openocd
pkgver=6268.6c74255
pkgrel=1
pkgdesc="Debugging, in-system programming and boundary-scan testing for embedded target devices (git version)"
arch=('i686' 'x86_64')
url="http://openocd.sourceforge.net/"
license=('GPL')
depends=()
optdepends=('libftdi: support devices using this FTDI implementation'
            'libftd2xx: support devices using this FTDI implementation'
            'hidapi: support CMSIS-DAP compliant devices')
makedepends=('git' 'automake>=1.11' 'autoconf' 'libtool' 'tcl')
options=(!strip)
install=openocd-git.install
provides=('openocd')
conflicts=('openocd')
source=("${_gitname}::git://git.code.sf.net/p/openocd/code")
md5sums=('SKIP')

# Specify desired features and device support here. A list can be
# obtained by running ./configure in the source directory.
_features=(oocd_trace parport remote-bitbang sysfsgpio)

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/${_gitname}"

  ./bootstrap
  ./configure --prefix=/usr ${_features[@]/#/--enable-} \
    --enable-maintainer-mode \
    --disable-werror
  
  make
}

package() {
  cd "$srcdir/${_gitname}"
  make DESTDIR=${pkgdir} install 
}
