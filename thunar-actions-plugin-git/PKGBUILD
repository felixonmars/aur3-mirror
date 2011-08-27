# Contributor: 4javier <4javier4@gmail.com>
pkgname=thunar-actions-plugin-git
pkgver=6546
pkgrel=1
pkgdesc="Git version of Thunar contestual menu plugin."
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-actions-plugin/"
license=('GPL')
depends=(thunar)
makedepends=(gcc git xfce4-dev-tools)
provides=(thunar-actions-plugin)
conflicts=(thunar-actions-plugin)
source=()
md5sums=()

_gittrunk=git://git.xfce.org/thunar-plugins/thunar-actions-plugin
_gitmod=thunar-actions-plugin


build() {
  cd ${srcdir}
  
  if [ -d ${srcdir}/$_gitmod ]; then
    if (cd $_gitmod && git pull origin) |
        grep 'Already up-to-date'; then
                msg "No need to rebuild";
              exit;
    fi
    msg "Local files are updated."
  else
    git clone $_gittrunk 
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r $_gitmod $_gitmod-build
  cd ${srcdir}/$_gitmod-build

  ./autogen.sh --prefix=$(pkg-config --variable prefix thunarx-1)
  make || return 1
  make DESTDIR="$pkgdir" install

  rm -rf ${srcdir}/$_gitmod-build
}

