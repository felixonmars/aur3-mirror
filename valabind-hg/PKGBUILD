# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from Mercurial(hg) sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=valabind-hg
pkgver=9999
pkgrel=1
pkgdesc="Tool to parse vala or vapi files to transform them into swig interface files, C++ source files, GIR or GEAR"
arch=('i686' 'x86_64')
url="http://hg.youterm.com/valabind"
license=('GPLv3')
makedepends=('mercurial')
depends=('vala' 'swig')
conflicts=('valabind')
provides=('valabind')

_hgroot="http://hg.youterm.com"
_hgrepo="valabind"

build() {
  msg "This package is deprecated, since the project moved to github."
  msg "Please install valabind-git instead."
}

package() {
  return 1
} 
