# Maintainer: Markus Opitz <mastero23 at gmail dot com>

pkgname=x2goserver-git
pkgver=20120312
pkgrel=1
pkgdesc="Open source terminal server"
arch=('i686' 'x86_64')
url="http://www.x2go.org/"
license=('GPL')
depends=('openssh' 'perl-config-simple' 'perl-dbd-sqlite' 'python' 'x2goagent-git' 'xorg-xauth')
options=(emptydirs)
install=x2goserver.install
source=('x2goserver.rc.d')
md5sums=('8083819ac423401440c0ad5feef1a128')

_gitname="${pkgname%-git}"
_gitroot="git://code.x2go.org/$_gitname.git"

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

  sed -i 's@mkdir -p /etc/@mkdir -p $(DESTDIR)/etc/@' x2goserver-xsession/Makefile
  sed -i 's@touch /etc/@touch $(DESTDIR)/etc/@' x2goserver-xsession/Makefile
  make build-arch
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  install -D -m 755 "$srcdir/x2goserver.rc.d" "$pkgdir/etc/rc.d/x2goserver"
}
