# Contributor: Lex Rivera <x-demon@x-demon.org>
pkgname=madwimax-git
pkgver=20130116
pkgrel=1
pkgdesc="MadWimax is a reverse-engineered linux driver for Mobile Wimax (802.16e) devices based on Samsung CMC-730 chip. GIT version."
arch=('i686' 'x86_64')
url="http://code.google.com/p/madwimax/"
license=('GPL2')
depends=('bash' 'libusb')
makedepends=('asciidoc' 'docbook-xsl' 'docbook2x' 'git')
optdepends=('dhclient')
conflicts=('madwimax-svn' 'madwimax-git')
source=('configure.ac.docbook2man.patch')
md5sums=('a94ec2de6ea88d204e294ac412b429ef')

_gitroot="git://github.com/ago/madwimax.git"
_gitname="madwimax"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #setup build dir.
  rm -r $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build
  patch -p1 < ../../configure.ac.docbook2man.patch
  autoreconf --install
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
# vim:syntax=sh
