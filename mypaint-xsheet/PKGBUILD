# Maintainer: Sean Rand <asanernd@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>
# Contributor: mosra <mosra@centrum.cz>

pkgname=mypaint-xsheet
pkgver=20120815
pkgrel=1
pkgdesc="MyPaint with support for traditional hand-drawn animation"
arch=('i686' 'x86_64')
url="http://mypaint.intilinux.com/"
license=('GPL')
depends=('pygtk' 'python2-numpy')
makedepends=('scons>=0.97' 'swig>=1.3.39' 'git')
conflicts=('mypaint')
provides=('mypaint')
[ "$CARCH" = "i686" ] && optdepends=('psyco: improved performance')
source=('mypaint-xsheet.install')
md5sums=('b993d2f9ea74557916b793f64bd410c3')
install=mypaint-xsheet.install

_gitroot="git://gitorious.org/~seanrand/mypaint/mypaint-xsheet.git"
_gitname="mypaint-xsheet"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #BUILD
  scons
  scons prefix="$pkgdir"/usr install
}
