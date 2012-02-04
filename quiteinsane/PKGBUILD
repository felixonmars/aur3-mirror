# Contributor: Pierre Renié <archlinuxien@gmail.com>

pkgname=quiteinsane
pkgver=0.10
pkgrel=5
pkgdesc="A graphical frontend for SANE based on Qt"

depends=('sane' 'qt' 'libtiff')

url="http://sourceforge.net/projects/quiteinsane/"

# The project is closed, see http://sourceforge.net/forum/forum.php?forum_id=370515
# The files are deleted, it's why I'm using the debian mirror to retrieve them.
source=(ftp://ftp.debian.org/debian/pool/main/q/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz gcc4.patch)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver} || return 1
  patch -Np0 -i ${startdir}/src/gcc4.patch || return 1
  ./configure --enable-mt --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install || return 1
  mkdir $startdir/pkg/usr/share/pixmaps/ || return 1
  cp $startdir/src/${pkgname}-${pkgver}/${pkgname}/quiteinsane_logo.xpm $startdir/pkg/usr/share/pixmaps/
}
md5sums=('f07006e5de95a6c326166696638ca3b5' '88baaa3ea0b9f49be4c5497db3546a82')
