# Maintainer: Kirill Strizhak <k.strizhak84@gmail.com>
pkgname=patchfork-git
pkgver=20150303
pkgrel=1 
pkgdesc="A web client for MPD written in PHP and Ajax (pitchfork fork)"
url="http://git.joshuawise.com/patchfork.git/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('php>=5.1.3' 'php-apache' 'php-pear')
makedepends=()
conflicts=('pitchfork')
replaces=('pitchfork')
backup=()
install=patchfork.install
source=(patchfork.conf)
md5sums=('9146ded69c6b1645933348fcfbb50fa0')

_gitroot="http://git.joshuawise.com/git/patchfork.git"
_gitname="patchfork"

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
}

package() {
  mkdir -p $pkgdir/srv/http/patchfork
  cd $pkgdir/srv/http/patchfork
  cp -a $srcdir/patchfork-build/* .
  chown http $pkgdir/srv/http/patchfork/config
  mkdir -p $pkgdir/etc/httpd/conf/extra
  cp $srcdir/patchfork.conf $pkgdir/etc/httpd/conf/extra
}
