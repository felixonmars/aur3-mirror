# Maintainer: William Osler <wosler@acm.org> 
pkgname=python2-praw-git
pkgver=20130302
pkgrel=2
pkgdesc="A python package that allows for simple access to reddit's API" 
arch=('any')
url="https://github.com/praw-dev/praw"
license=('GPL3')
depends=(python2-distribute python2-six python2-requests python2-update_checker-git) 
makedepends=(git)
_gitroot="git://github.com/praw-dev/praw.git"
_gitname="praw"

build() {
  msg "Connecting to github.com GIT server...."
    if [[ -d $_gitname ]] ; then
      ( cd "$_gitname" && git pull origin )
      msg "The local files are updated."
    else
      git clone "$_gitroot" --depth=1
    fi
  msg "GIT checkout done or server timeout"

  cd "$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
