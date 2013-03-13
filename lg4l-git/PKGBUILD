# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=lg4l-git
pkgver=20130313
pkgrel=1
pkgdesc="Logitech for Linux"
arch=(x86_64)
url="http://lg4l.wikia.com/wiki/LG4L_Wiki"
license=('GPL')
depends=('linux>=3.7' 'linux<3.8')
makedepends=('git' 'linux-headers>=3.7' 'linux-headers<3.8')
install=lg4l-git.install

_gitroot="git://github.com/CMoH/lg4l.git"
_gitname="lg4l"
_extramodules=extramodules-3.7-ARCH
_kernver="$(cat /lib/modules/${_extramodules}/version)"


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
 
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
 
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir"
  if [ -d $_gitname-build ] ; then
    rm -rf $_gitname-build
  fi

  git clone $_gitname $_gitname-build
  
  cd "$srcdir/$_gitname-build"
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d "$pkgdir/lib/modules/${_kernver}/extra" 
  install -t "$pkgdir/lib/modules/${_kernver}/extra/" *.ko
  sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/$install"
  sed -i "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" "$startdir/$install"
}

# vim:set ts=2 sw=2 et:
