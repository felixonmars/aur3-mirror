# Maintainer: Sandro Munda <munda.sandro@gmail.com>

pkgname=python2-sleekxmpp-git-devel
pkgver=20121004
pkgrel=1
pkgdesc="An XMPP library written for Python 3.x (with 2.6 compatibility) -
Development branch"
arch=(any)
url="http://github.com/fritzy/SleekXMPP"
license=('MIT')
depends=('python2')
makedepends=('git')
optdepends=('python2-dnspython-git: SRV records')
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
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
