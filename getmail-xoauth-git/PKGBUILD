# Raghavendra D Prabhu - raghu Dot prabhu 13 AT gmail dot com
pkgname=getmail-xoauth-git
pkgver=20101020
pkgrel=1
pkgdesc="A POP3/IMAP4 mail retriever with reliable Maildir and command delivery - patched for google xoauth"
arch=(i686 x86_64)
license="GPL"
depends=('python2>=2.6.4')
conflicts=('getmail')
makedepends=('git')
source=(README.markdown)
md5sums=('d5e7724de8bf2b8ad43f43720523aa37')
url="http://github.com/ronin13"
_gitroot="git://github.com/ronin13/getmail.git"
_gitname="getmail"

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

  #
  # BUILD HERE
  #

  /usr/bin/python2 setup.py build
  /usr/bin/python2 setup.py install --root=${pkgdir}
}
