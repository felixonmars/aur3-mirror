# Maintainer: Jonathan Arnold <jdarnold@buddydog.org

pkgname=python-sleekxmpp-git
pkgver=20120525
pkgrel=2
pkgdesc="An XMPP library written for Python 3.x"
arch=(any)
url="http://github.com/fritzy/SleekXMPP"
license=('MIT')
depends=('python')
makedepends=('git')
options=(!emptydirs)
optdepends=('python-dnspython: SRV support')

_gitroot="git://github.com/fritzy/SleekXMPP.git"
_gitname="sleekxmpp"

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

  cd "$srcdir/$_gitname"

  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python setup.py install --root="$pkgdir/" --optimize=1
}
