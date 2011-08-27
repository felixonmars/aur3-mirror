# Contributor: Yonathan Dossow <ydossow@archlinux.cl>

pkgname=qcairo
pkgver=1.8.7.1
_rpmrel=3
pkgrel=3
pkgdesc="Modified cairo for SPICE"
arch=('i686' 'x86_64')
url="http://www.spice-space.org"
license=('GPL')
depends=('qpixman' 'libpng')
makedepends=('rpmextract')
install=
source=(ftp://ftp.redhat.com/pub/redhat/linux/enterprise/5Client/en/os/SRPMS/$pkgname-$pkgver-$_rpmrel.el5.src.rpm use-arch-libpng14.patch)
noextract=()
md5sums=('bb9f6db05b1bf3bfeee8cb347431426a'
         '4a654b6d78b691ef28d70219e7304742')

build() {
  cd $srcdir
  rpmextract.sh $pkgname-$pkgver-$_rpmrel.el5.src.rpm
  tar xzf qcairo-1.8.7.1-git74d6b5.tar.gz
  cd "$srcdir/qcairo-1.8.7.1-git74d6b5"

  patch -p1 -i ../use-arch-libpng14.patch
./autogen.sh --prefix=/usr --disable-static 	\
	--enable-warnings 	\
	--enable-xlib 		\
	--enable-freetype 	\
	--enable-ps 		\
	--enable-pdf 		\
	--enable-svg 		\
	--disable-gtk-doc
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
