# Contributor: Damnshock <damnshock-youknowwhatgoeshere-gmail.com>
# Contributor: skualito <lepascalouATgmail>
pkgname=mutt-sidebar-nntp
pkgver=1.5.20
pkgrel=3
pkgdesc="A small but very powerful text-based mail client with sidebar-patch and nntp support"
patchdate="20090619"
arch=('any')
url="http://lunar-linux.org/index.php?page=mutt-sidebar"
depends=('openssl' 'gdbm' 'mime-types' 'libsasl' 'slang')
makedepends=('gnupg' 'gpgme')
conflicts=('mutt')
provides=('mutt')
source=(ftp://ftp.mutt.org/mutt/devel/mutt-${pkgver}.tar.gz 
	http://lunar-linux.org/~tchan/mutt/patch-${pkgver}.sidebar.$patchdate.txt  
	muttrc.example 
	patch-1.5.20.vvv.nntp.2
	mutt_ssl.patch
	mutt-unmailbox.patch)
md5sums=('027cdd9959203de0c3c64149a7ee351c' 
	 '5786519489877c92e4fff68cf547e869' 
	 '336d1d8e290a0595dbe2cd92d720ffc9' 
	 '1aefc046f02b1bbea3ae4b2e8e6a25de'
         '3f54850315502ad47405421339ffae60'
	 'fa8e03a49a2fa7b294dc8237d928cdb7')
license=('GPL')

build() {
  cd $srcdir/mutt-$pkgver
  # patch a segfault bug in 1.5.20 -- remove for next release
  patch -p1 -i ../mutt-unmailbox.patch
  patch -p1 -i ../mutt_ssl.patch
  patch -p1 -i ../patch-${pkgver}.sidebar.$patchdate.txt
  patch -p1 -i ../patch-${pkgver}.vvv.nntp.2
  aclocal -I m4
  autoheader
  automake --foreign
  autoconf
  ./configure --prefix=/usr --sysconfdir=/etc \
  --enable-pop --enable-imap --enable-nntp --enable-smtp --enable-pgp --enable-hcache \
  --enable-gpgme --with-ssl=/usr --with-sasl --without-idn \
  --with-regex --with-slang|| return 1
  make || return 1
  make DESTDIR=$pkgdir install
  rm -f ${pkgdir}/usr/bin/{flea,muttbug}
  rm -f ${pkgdir}/usr/share/man/man1/{flea,muttbug}.1
  rm -f ${pkgdir}/etc/mime.types*
  install -m644 -D ${srcdir}/muttrc.example ${pkgdir}/etc/muttrc.example
}
