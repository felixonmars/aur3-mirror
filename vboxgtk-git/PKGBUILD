# Maintainer: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>

pkgname=vboxgtk-git
_gitname=vboxgtk
pkgver=r6.ce15e10
pkgrel=1
pkgdesc="A GTK+ client for VirtualBox"
arch=('i686' 'x86_64')
url="http://code.google.com/p/vboxgtk/"
license=('GPL3')
depends=('gtk3' 'python2-gobject2>=2.28.6' 'virtualbox>=4.1.2' 'virtualbox-sdk>=4.1.2')
makedepends=('git' 'intltool')
provides=('vboxgtk')
conflicts=('vboxgtk')
install=vboxgtk.install
source=('git+http://code.google.com/p/vboxgtk/'
        'gtkgrid-fix.patch' )
md5sums=('SKIP'
         '6d2e8c3429d6039970366eb4fbf5a8eb')

pkgver() {
  cd ${_gitname}

  # Use the tag of the last commit
  # git describe --always | sed 's|-|.|g'
  
  # Use current date
  # date +%Y%m%d

  # Use the number of revisions since beginning of the history
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_gitname}
  
  # apply patches
  patch -Np0 -i ../gtkgrid-fix.patch
}

package() {
  cd ${_gitname}

  python2 setup.py install --root=${pkgdir}
}

