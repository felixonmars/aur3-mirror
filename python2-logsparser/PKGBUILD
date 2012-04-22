# Maintainer:  GEEK1 <arch@geek1.de>
pkgname=python2-logsparser
pkgver=20120422
pkgrel=1
pkgdesc="A log parser library packaged with a set of ready to use parsers (DHCPd, Squid, Apache, ...)"
arch=('any')
url="http://github.com/wallix/pylogsparser"
license=('LGPL')
depends=('python2' 'python2-lxml' 'python2-pytz')
options=(!emptydirs)
makedepends=('git')

_gitroot=https://github.com/wallix/pylogsparser.git
_gitname=pylogsparser

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    if [ $? -ne 0 ]; then
      msg "GIT checkout failed."
      return 1
    fi
    
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    if [ $? -ne 0 ]; then
      msg "GIT checkout failed."
      return 1
    fi
    
    msg "GIT checkout done."
  fi
}

package() {
  cd "$srcdir/$_gitname"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}
