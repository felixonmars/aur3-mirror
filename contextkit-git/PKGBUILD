# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Jon Nordby <jononor@gmail.com>

_pkgname=contextkit
pkgname=$_pkgname-git
pkgver=20101220
pkgrel=1
pkgdesc="Contextual information collection framework"
arch=('x86_64' 'i686')
url="http://maemo.gitorious.org/maemo-af/contextkit"
license=('LGPL')
makedepends=('git')
depends=('qt' 'qjson' 'tinycdb' 'perl-xml-dom')
provides=($_pkgname)
conflicts=($_pkgname)
source=('0001-Fix-undefined-reference-to-chmod.patch')
md5sums=('635c1c7ad076c30ee89825b2643db1ea')

_gitroot="git://gitorious.org/maemo-af/contextkit.git"
_gitname="$_pkgname"

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

  patch -p1 < "$srcdir/0001-Fix-undefined-reference-to-chmod.patch"

  # BUILD
  ./autogen.sh --prefix=/usr
  make
  make install DESTDIR="$pkgdir/"
} 
