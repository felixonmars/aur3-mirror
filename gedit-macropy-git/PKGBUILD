# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>

pkgname=gedit-macropy-git
_gitname=gedit-macropy
pkgver=20130612
pkgrel=1
pkgdesc="Gedit 3 python plugin for recording and playing back macros."
arch=('any')
url="https://github.com/eguaio/gedit-macropy"
license=('GPL3')
depends=('gedit>=3' 'pygtk')
makedepends=('git')
source=('git+https://github.com/eguaio/gedit-macropy.git')
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}

  # Use the tag of the last commit
  # git describe --always | sed 's|-|.|g'
  
  # Use current date
  date +%Y%m%d
}

package() {
  cd ${_gitname}

  install -d ${pkgdir}/usr/lib/gedit/plugins
  install -m644 macropy.plugin macropy.py ${pkgdir}/usr/lib/gedit/plugins
}
