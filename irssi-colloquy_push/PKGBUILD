pkgname=irssi-colloquy_push
_name=colloquy_push.pl
pkgver=0.8.15
pkgrel=7
pkgdesc="irssi with colloquy_push patch and script"
arch=('i686' 'x86_64', 'armv6h')
url="http://irssi.org/"
license=('GPL')
depends=('glib2' 'openssl')
optdepends=('perl-libwww: for the scriptassist script')
backup=('etc/irssi.conf')
source=("http://irssi.org/files/irssi-${pkgver}.tar.bz2"
	colloquy_push.patch
        "http://static.ssji.net/colloquy_push.pl.txt")
options=('!libtool')
md5sums=('1dcb3f511b88df94b0c996f36668c7da'
	'a0620c630c63d8285afbd414d48cbc7f'
	'9c0ed5755abdd60c1e15e710671fdbec')

build() {
  cd "${srcdir}/irssi-${pkgver}"

  patch -p0 < "${srcdir}/colloquy_push.patch"

  ./configure --prefix=/usr \
              --enable-ipv6 \
	      --with-proxy \
	      --sysconfdir=/etc \
	      --with-perl-lib=vendor

  make
}

package() {
  cd "${srcdir}/irssi-${pkgver}"

  make DESTDIR="${pkgdir}" install 

  install -Dm644 "$srcdir/$_name.txt" "$pkgdir/usr/share/irssi/scripts/$_name"
}
