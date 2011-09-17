


pkgname=xsheet-mypaint
pkgver=0.9.1+git
pkgrel=1
pkgdesc="A fast and easy painting application for digital painters, with brush dynamics"
arch=('i686' 'x86_64')
url="http://mypaint.intilinux.com/"
license=('GPL')
depends=('pygtk' 'python-numpy')
makedepends=('scons>=0.97' 'swig>=1.3.39' 'git')
install=xsheet-mypaint.install
conflicts=('mypaint')
provides=('mypaint')
[ "$CARCH" = "i686" ] && optdepends=('psyco: improved performance')

_gitroot="git://gitorious.org/~manuq/mypaint/xsheet-mypaint.git"
_gitname="xsheet-mypaint"

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

