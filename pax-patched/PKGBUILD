pkgname=pax-patched
pkgver=3.4
pkgrel=1
pkgdesc="The POSIX standard archive tool, supporting the two most common forms of standard Unix archive (backup) 
files - CPIO and TAR. You can compile this using gcc 4.6"
arch=('i686' 'x86_64')
url="http://ftp.suse.com/pub/people/kukuk/pax/"
license=('BSD')
groups=()
depends=()
makedepends=()
provides=('pax')
conflicts=('pax')
replaces=('pax')
backup=()
options=()
install=
source=(http://ftp.suse.com/pub/people/kukuk/pax/pax-$pkgver.tar.bz2
        fts.c.patch)
noextract=()

md5sums=('fbd9023b590b45ac3ade95870702a0d6'
         '2b378ebb678b4c18cce559d604e9011f') #generate with 'makepkg -g'

build() {
  cd "$srcdir/pax-$pkgver"
  patch -uN lib/fts.c $srcdir/fts.c.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING || return 1
}

# vim:set ts=2 sw=2 et:
