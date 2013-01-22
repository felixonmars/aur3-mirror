# Contributor: fi-dschi <fi-dschi_archlinux@arcor.de>

pkgname=prsannots
pkgver=20130121
pkgrel=4
pkgdesc="Sony ebook reader PRS-T1 PRS-T2 pdf annotation exporting and pdf cropping tool"
arch=('i686' 'x86_64')
url="https://github.com/rschroll/prsannots"
license=('LGPL3')
depends=(
  'python2-pypdf' 'pdfminer')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
options=()
source=()
md5sums=()

_gitroot="git://github.com/rschroll/prsannots.git"
_gitname="prsannots"


build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
}

package() {
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
