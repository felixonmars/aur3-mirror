# Sam May (a.k.a. samwise)
# sam.m4y@gmail.com
pkgname=python-gtkextra
pkgver=20081226
pkgrel=1
pkgdesc="Python language bindings for the GtkExtra widget set"
url="http://python-gtkextra.sourceforge.net/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('python' 'pygtk' 'gtk2+extra')
makedepends=('cvs' 'libtool' 'automake' 'pygobject')
# not needed for a cvs build
source=()
md5sums=()


_cvsroot=":pserver:anonymous:@python-gtkextra.cvs.sourceforge.net:/cvsroot/python-gtkextra"
_cvsmod="python-gtkextra2"

build() {
    cd ${srcdir}

    msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
    cvs -d$_cvsroot co -P $_cvsmod

    msg "CVS checkout done or server timeout"
    cd $_cvsmod

    msg "Performing pygobject codegen path workaround..."
    cp -R /usr/share/pygobject/2.0/codegen/ gtkextra/

    msg "Starting make..."
    ./autogen.sh --prefix=/usr
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
