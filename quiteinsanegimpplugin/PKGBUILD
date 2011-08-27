# Contributor: Pierre Renié <archlinuxien@gmail.com>

pkgname=quiteinsanegimpplugin
pkgver=0.3
pkgrel=2
pkgdesc="A Qt based SANE plugin for GIMP 2.0"

depends=('qt' 'sane>=1.0.3' 'gimp>=2.0.0')

url="http://sourceforge.net/projects/quiteinsane/"

# The project is closed, see http://sourceforge.net/forum/forum.php?forum_id=370515
# The files are deleted, it's why I'm using the debian mirror to retrieve them.
source=(ftp://ftp.debian.org/debian/pool/main/q/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver} || return 1
  ./configure --enable-mt --prefix=/usr
  make || return 1
  mkdir -p $startdir/pkg/usr/lib/gimp/2.0/plug-ins || return 1
  cp quiteinsanegimpplugin/quiteinsanegimpplugin $startdir/pkg/usr/lib/gimp/2.0/plug-ins
}
md5sums=('270c315a26c110bde1d0232e3ce0e1c4')
