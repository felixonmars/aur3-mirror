# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=vain34-git
pkgver=20131121
pkgrel=1
pkgdesc="Layouts, Utilities and Widgets for Awesome WM v3.4"
arch=('any')
url="https://github.com/vain/awesome-vain"
license=('GPL')
depends=('awesome34')
makedepends=('git')

_gitroot="git://github.com/vain/awesome-vain.git"
_gitname="awesome-vain"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [[ -d ${_gitname} ]]; then
    (cd ${_gitname} && git pull origin)
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_gitname}-build
  git clone ${_gitname} ${_gitname}-build
}

package() {
  cd ${srcdir}/${_gitname}-build
  
  # Create installation directories
  install -d -m755 "${pkgdir}/usr/share/awesome/lib/vain/"
  # Install
  cp -a vain "${pkgdir}/usr/share/awesome/lib/" || return 1
  
  # Fix permissions. Stupid ntfs.
  find "$pkgdir" -type d -print0 | xargs -0 chmod -R 755
  find "$pkgdir" -type f -print0 | xargs -0 chmod -R 644
}