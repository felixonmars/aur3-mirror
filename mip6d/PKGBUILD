# $Id: PKGBUILD 178 2009-08-14 11:56:59Z shtrom $
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=mip6d
_umipname=mipv6-daemon-umip
pkgver=0.4
_neplrel=20090624
_mcoarel=20090624
_dsmipname=umip-dsmip
_dsmipver=0.1
_dsmiprel=20080530
pkgrel=1
pkgdesc="UMIP userland with NEPL and MCoA supports for Mobile IPv6/NEMO operation with multihoming"
arch=(i686 x86_64)
url="http://www.nautilus6.org/doc/nepl-howto/nepl-howto.html"
license=('GPL' 'custom')
groups=()
depends=('kernel26-nemo')
makedepends=(indent)
optdepends=('radvd: to act as a NEMO Mobile Router advertising a MNP on the mobile link')
backup=(etc/mip6d/mip6d.conf etc/conf.d/mip6d.conf)
source=(ftp://ftp.linux-ipv6.org/pub/usagi/patch/mipv6/umip-${pkgver}/daemon/tarball/${_umipname}-${pkgver}.tar.gz
        http://www.nautilus6.org/doc/nepl-howto/umip-nepl/${_umipname}-${pkgver}-nepl-${_neplrel}.patch
        http://www.nautilus6.org/doc/nepl-howto/umip-nepl/${_umipname}-${pkgver}-nepl-mcoa-${_mcoarel}.patch
        http://software.nautilus6.org/packages/DSMIP/${_dsmipname}-${_dsmiprel}.tar.bz2
        http://software.nautilus6.org/packages/DSMIP/${_dsmipname}-${_dsmipver}-patches.tar.bz2
        mip6d.init
        mip6d.confd)
md5sums=('a8ebeb4f41ceed71037d0f5596ccc11d'
         '501861f2d537377dc0f52f7a3e1b7314'
         'd387155494f5224b780c41c0e1acd588'
         '54790f8b7f1ee5e58feccf88b64daebf'
         '574127844e110d8d6a0ecfb199a34b53'
         '6995ae716fc0f66040ee528c291f08df'
         'efbe23915c7dcf018ce70bcf72d18be7')


build() {
  cd "$srcdir/${_umipname}-${pkgver}"

  patch -p 1 < $srcdir/${_umipname}-${pkgver}-nepl-${_neplrel}.patch
  patch -p 1 < $srcdir/${_umipname}-${pkgver}-nepl-mcoa-${_mcoarel}.patch
  echo FIXME: support DSMIP
  exit 1
  autoreconf -i 
  ./configure --prefix=/usr --enable-vt
  make CFLAGS=-DNULL=0 || return 1
  make DESTDIR="$pkgdir/" install

  for file in extras/example-*.conf; do
    install -D -m 0644 $file $pkgdir/etc/mip6d/${file/extras\/example/mip6d}
  done
  install -m 0644 $pkgdir/etc/mip6d/mip6d-mn.conf $pkgdir/etc/mip6d/mip6d.conf

  install -D -m 0755 $srcdir/mip6d.init $pkgdir/etc/rc.d/mip6d
  install -D -m 0644 $srcdir/mip6d.confd $pkgdir/etc/conf.d/mip6d.conf

  install -d $pkgdir/usr/share/licenses/${pkgname}
  install -m 0644 COPYING* licenses/*.txt $pkgdir/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
