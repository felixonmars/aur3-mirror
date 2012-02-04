# Contributor: Cesar Alcalde <lambda512 _at_ gmail.com>
pkgname=swift-git
pkgver=20120103
pkgrel=1
pkgdesc="A pragmatic, cross-platform, user-friendly Jabber/XMPP client. Still in developement"
arch=('i686' 'x86_64')
url="http://swift.im/"
license=('GPL3')
groups=()
depends=('libidn' 'avahi' 'libxss' 'expat' 'openssl' 'qt' 'hicolor-icon-theme' 'boost-libs' 'libxml2' 'libidn' 'qtwebkit')
makedepends=('git' 'scons' 'boost')
provides=('swift')
conflicts=('swift')
replaces=()
backup=()
options=()
install=swift.install
source=()
noextract=()
md5sums=()

_gitroot="git://swift.im/swift"
_gitname="swift"

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

  scons optimize=1 debug=0 allow_warnings=1 qt=/usr/ \
        SWIFT_INSTALLDIR=${pkgdir}/usr ${pkgdir}/usr

} 
# vim:set ts=2 sw=2 et:

