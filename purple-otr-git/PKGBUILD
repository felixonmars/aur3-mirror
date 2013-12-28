# Maintainer: arkhan

pkgname=purple-otr-git
pkgver=20120102
pkgrel=4
pkgdesc='Off-the-Record Messaging plugin for Pidgin and Finch git version'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.cypherpunks.ca/otr/'
depends=('libotr>=3.2.0' 'perlxml' 'git' 'finch' 'pidgin')
makedepends=('automake-1.11')
_gitroot="https://github.com/arkhan/purple-otr.git"
_gitname="purple-otr"

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
    
    autoreconf -s -i 
    ./configure --prefix=/usr
    make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}
