# Contributor: letmeinba <letmeinba@gmail.com>

pkgname=gemanx-svn
pkgver=68
pkgrel=1
pkgdesc="GeMan X is a Term BBS Client beyond PCMan X"
arch=('i686' 'x86_64')
url="http://gemanx.googlecode.com/svn/trunk/"
license=('GPL')
depends=('gtk2' 'wget')
makedepends=('autoconf' 'automake' 'subversion' 'intltool')
options=('!libtool')
provides=('gemanx')
conflicts=('gemanx')
source=(gemanx.install)
md5sums=('d86a886397e254f06b5e6e9a22cb4127')
install=gemanx.install


package() {
    cd ${srcdir}
    svn checkout ${url} gemanx-read-only
    msg "SVN checkout done or server timeout"
    msg "Starting make..."


    cd gemanx-read-only
    ./autogen.sh
    ./configure --prefix=/usr --enable-static --disable-shared --enable-wget --enable-iplookup --enable-imageview || return 1
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
}


