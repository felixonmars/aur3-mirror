# Maintainer: Mike Krueger <info@memoryleakx.dudmail.com>

pkgname=xfce-theme-darkorangebird
pkgver=0.4.0
pkgrel=2
pkgdesc="A dark/Orange Xfce theme, based on Blackbird and Greybird."
arch=('any')
url="https://github.com/memoryleakx/xfce-theme-darkorangebird"
license=('GPL2', 'CC-BY-SA 3.0')
depends=('gtk-engine-murrine')
makedepends=('git')

_gitroot="git://github.com/memoryleakx/xfce-theme-darkorangebird.git"
_gitname="xfce-theme-darkorangebird"

build() {
  cd $srcdir

  msg "Getting sources"

  cd "${srcdir}"

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
}

package() {
  cd ${srcdir}/$_gitname
  mkdir -p $pkgdir/usr/share/themes/DarkOrangeBird/
  cp -R * $pkgdir/usr/share/themes/DarkOrangeBird
}
