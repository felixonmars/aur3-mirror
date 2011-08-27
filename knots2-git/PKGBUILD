# Contributor: Carol Alexandru <shapeshifter at archlinux.us>
pkgname=knots2-git
pkgver=20100214
pkgrel=1
pkgdesc="A feature rich streaming server"
arch=('i686' 'x86_64')
url="http://wiki.maemo.org/Knots2"
license=('GPL')
depends=('ruby' 'ruby-sqlite3' 'vlc' 'ffmpeg')
makedepends=('git')
provides=('knots2')
conflicts=('knots2')
source=('knots2')
md5sums=('b5c1838abe7679059ec60a6685daae47')

_gitroot="git://github.com/solmis/knots.git"
_gitname="knots"

build() {
  cd ${startdir}/src
  msg "Connecting to GIT server...."
  git clone ${_gitroot}
  
  msg2 "GIT checkout done or server timeout"
  msg "Installing to /opt/knots2..."

  mkdir -p ${pkgdir}/opt/knots2
  cp -R ${srcdir}/knots/* ${pkgdir}/opt/knots2
  install -D -m755 ${startdir}/knots2 ${pkgdir}/usr/bin/knots2
}

