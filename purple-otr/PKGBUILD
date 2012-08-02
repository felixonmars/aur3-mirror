# Maintainer: Reza Jelveh

pkgname=purple-otr
pkgver=20120102
pkgrel=2
pkgdesc='Off-the-Record Messaging plugin for Pidgin and Finch.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.cypherpunks.ca/otr/'
depends=('libotr>=3.2.0' 'pidgin' 'perlxml' 'git')
makedepends=('automake-1.11')
_gitroot="git://gitorious.org/purple-otr/purple-otr.git"
_gitname="purple-otr"

# PKGBUILD functions
build() {
    cd "$srcdir"
    msg2 "Connecting to github.com GIT server...."
    if [ -d "$srcdir/$_gitname" ] ; then
        cd "$_gitname" && git pull origin || return 1
        msg2 "The local files are updated."
    else
        git clone "$_gitroot" || return 1
        cd "$_gitname"
    fi

    ./configure --prefix=/usr
    make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}
