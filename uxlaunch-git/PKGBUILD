# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=uxlaunch-git
pkgver=20110220
pkgrel=1
pkgdesc="A generic X session launch utility for MeeGo"
arch=('i686' 'x86_64')
url="http://meego.com"
license=('GPL')
groups=('meego')
depends=('consolekit' 'xdg-user-dirs')
makedepends=('git')
provides=('uxlaunch')
conflicts=('uxlaunch')
source=('startmeego.sh' 'arch-meego.desktop' 'meego.path')
md5sums=('72628960e726038a8ca645366c102671'
         '9ce24925123f37dc39ed101b376b6bbc'
         '9c8290a6eef34738eb7e0a5b28be7504')

_gitroot="git://gitorious.org/meego-os-base/uxlaunch.git"
_gitname="uxlaunch"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure --prefix=/usr
  make mutterlibexedir=/usr/lib/mutter
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install

  install -Dm644 ${srcdir}/meego.path \
    ${pkgdir}/etc/gconf/2/meego.path
  install -d ${pkgdir}/etc/gconf/gconf.xml.meego

  install -Dm644 ${srcdir}/arch-meego.desktop \
    ${pkgdir}/usr/share/xsessions/arch-meego.desktop
  install -Dm755 ${srcdir}/startmeego.sh \
    ${pkgdir}/usr/bin/startmeego

  install -d ${pkgdir}/var/log
  touch ${pkgdir}/var/log/uxlaunch.log
}
