# Contributor: osily <ly50247@gmail.com>

pkgname=west-chamber-svn
pkgver=24
pkgrel=1
pkgdesc="a project whose name came from the Romance_of_the_West_Chamber"
arch=(i686 x86_64)
url="http://code.google.com/p/scholarzhang"
license=('GPL')
groups=()
depends=(iptables kernel26-headers)
makedepends=('subversion')

_svntrunk=http://scholarzhang.googlecode.com/svn/trunk
_svnmod=west-chamber
install=west-chamber-svn.install
build() {
  svn co ${_svntrunk} ${_svnmod}
  cd "${srcdir}/${_svnmod}/${_svnmod}"

  msg "start autogen.sh"
  ./autogen.sh

  msg "start configure"
  ./configure --prefix=/usr \
              --libexecdir=/usr/lib/iptables \
              --sysconfdir=/etc \
              --with-xtlibdir=/usr/lib/iptables

  msg "start make"
  make || return 1
}

package()
{
  cd "$srcdir/${_svnmod}/${_svnmod}"

  msg "start make install"
  make DESTDIR="$pkgdir" install || return 1

  mkdir -p $pkgdir/usr/share/west-chamber/examples || return 1
  install -m644 examples/{CHINA,GOOGLE,NOCLIP,YOUTUBE} $pkgdir/usr/share/west-chamber/examples || return 1
}

# vim:set ts=2 sw=2 et:
