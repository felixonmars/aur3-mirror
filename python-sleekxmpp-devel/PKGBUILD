# Maintainer: Mathieu Pasquet <mathieui@mathieui.net>

pkgname=python-sleekxmpp-devel
pkgver=20110315
pkgrel=1
pkgdesc="An XMPP library written for Python 3.x (with 2.6 compatibility) - Development branch"
arch=(any)
url="http://github.com/fritzy/SleekXMPP"
license=('MIT')
depends=('python')
makedepends=('git')
optdepends=('python-dnspython-git: SRV records') # though this lib is broken ATM
options=(!emptydirs)

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
  git checkout develop
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
