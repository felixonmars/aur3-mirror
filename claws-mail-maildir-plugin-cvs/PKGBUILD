# $Id$
# By John Soros <spam@r0x0r.me>
# No rights reserved (see http://sam.zoy.org/wtfpl/COPYING)
# trying to use https://projects.archlinux.org/abs.git/tree/prototypes/PKGBUILD-cvs.proto

pkgname=claws-mail-maildir-plugin-cvs
pkgver=20121028
pkgrel=1
pkgdesc="Unmaintained maildir++ plugin for claws-mail"
url="http://www.claws-mail.org/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('claws-mail>=3.8.1')
makedepends=('make' 'db' 'cvs')
options=('!libtool' '!strip')
md5sums=()
_cvsroot=":pserver:anonymous:@claws-mail.org:/"
_cvsmod="plugins/maildir"
_cvsdst="maildir"
_cvsbranch="gtk2"

build() {
  cd "$srcdir"
  if [[ -d maildir ]]; then
    cd "$_cvsdst"
    cvs -z3 update -d
  else
    msg "Starting cvs checkout"
    cvs -z3 -d"$_cvsroot" co -d "$_cvsdst" -r "$_cvsbranch" "$_cvsmod"
  fi
  cd "${srcdir}/${_cvsdst}"
  # fix build, docbook2txt is missing...
  sed -i 's/README//' Makefile.am
  ./autogen.sh
  #Fix the pluginconfig.h file not found error
  #See http://lists.claws-mail.org/pipermail/users/2012-July/002761.html
  cp config.h pluginconfig.h
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${_cvsdst}"
  make DESTDIR="${pkgdir}/" install
}
