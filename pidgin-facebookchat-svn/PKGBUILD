# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=pidgin-facebookchat-svn
pkgver=720
pkgrel=1
pkgdesc="Facebook chat plugin for Pidgin and libpurple messengers."
url='http://code.google.com/p/pidgin-facebookchat/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libpurple' 'json-glib')
makedepends=('subversion' 'patch')
conflicts=('pidgin-facebookchat')
provides=('pidgin-facebookchat')
source=(plugn_id.patch)
md5sums=('4e1310bff63bf7a89e54ef61a95989b2')

_svntrunk="http://pidgin-facebookchat.googlecode.com/svn/trunk/"
_svnmod="pidgin-facebookchat"

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

#  patch -p1 -i ${srcdir}/plugn_id.patch

  if [ "$CARCH" = "x86_64" ]; then
    make LINUX64_COMPILER=x86_64-unknown-linux-gnu-gcc libfacebook64.so  || return 1
    install -D -m644 libfacebook64.so \
      ${pkgdir}/usr/lib/purple-2/libfacebook64.so || return 1
  else
    make libfacebook.so  || return 1
    install -D -m644 libfacebook.so \
      ${pkgdir}/usr/lib/purple-2/libfacebook.so || return 1
  fi

  for i in 16 22 48; do
    install -D -m644 facebook${i}.png \
      ${pkgdir}/usr/share/pixmaps/pidgin/protocols/${i}/facebook.png || return 1
  done
}
