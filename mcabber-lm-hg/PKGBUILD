# Contributer: Johannes Schöllhorn (atcq at atcq dot de)
pkgname=mcabber-lm-hg
pkgver=1604
pkgrel=1
pkgdesc="Ncurses jabber-client using libloudmouth"
arch=('i686' 'x86_64')
url="http://bitbucket.org/franky/mcabber-lm/"
license=('GPL')
depends=('ncurses' 'loudmouth-md5digest' 'glib2' 'gpgme' 'libotr' 'aspell')
makedepends=('mercurial')
conflicts=('mcabber')
install="mcabber-lm.install"
source=("mcabber-lm.patch")
md5sums=("03b357f2169a9032e04d848f72b790de")

_hgroot="http://bitbucket.org/franky/"
_hgrepo=mcabber-lm

build() {
    cp -R $startdir/src/$_hgrepo $startdir/src/$_hgrepo-build
    cd $startdir/src/$_hgrepo-build/mcabber

    patch -p1 -i ../../mcabber-lm.patch || return 1

    ./autogen.sh || return 1

    ./configure --prefix=/usr \
                --enable-hgcset \
                --mandir=/usr/share/man \
                --enable-aspell \
                --enable-otr || return 1
    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
    mkdir -p $startdir/pkg/usr/share/mcabber/example

    msg "Copying mcabberrc.example to usr/share/mcabber/example/mcabberrc"
    
    cp -a $startdir/src/$_hgrepo/mcabber/mcabberrc.example \
          $startdir/pkg/usr/share/mcabber/example/mcabberrc

    rm -rf $startdir/src/$_hgrepo-build
}
