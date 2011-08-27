# Contributor: Graziano <graziano.giuliani@poste.it>
# Maintainer: John Gerritse <reaphsharc@gmail.com>

pkgname=ntlmaps
pkgver=0.9.9.0.1
pkgrel=7
pkgdesc="'NTLM Authorization Proxy Server' (APS) is a proxy software that allows you to authenticate via an MS Proxy Server using the proprietary NTLM protocol."
url="http://ntlmaps.sourceforge.net/"
license="GPL"
arch=('any')
depends=('python2')
backup=('etc/conf.d/ntlmaps')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}-${pkgver}.tar.gz paths.patch ntlmaps)
md5sums=('7ee0a00d5446f39ebbe5f0f90465986e'
         '601415667ede96abd7f608ea2551ed22'
         '86d2cef545e5548073b24032d70ee0fe')

build() {
  PYTHONVER=`python2 -c 'import sys;print(sys.version[0:3])'`
  cd $srcdir/$pkgname-$pkgver/
  patch -Np1 -i ../paths.patch
  sed -i "s/#! \/usr\/bin\/python/#! \/usr\/bin\/python2/" main.py
  #mkdir -p $pkgdir/usr/bin
  #mkdir -p $pkgdir/etc/conf.d
  #mkdir -p $pkgdir/etc/rc.d
  install -D -m 600 server.cfg $pkgdir/etc/conf.d/$pkgname
  PYDEST_SITE=$pkgdir/usr/lib/python$PYTHONVER/site-packages
  mkdir -p $PYDEST_SITE/$pkgname
  cp -a lib/* $PYDEST_SITE/$pkgname
  install -m 644 __init__.py $PYDEST_SITE/$pkgname/__init__.py
  install -D -m 755 main.py $pkgdir/usr/bin/$pkgname
  install -D -m 755 ../ntlmaps $pkgdir/etc/rc.d/ntlmaps
  echo $pkgname > $PYDEST_SITE/$pkgname.pth
}
