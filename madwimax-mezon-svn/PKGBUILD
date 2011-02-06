# Contributor: Vytautas Stankevicius <brotheris@gmail.com>
 arch=(i686 x86_64)
 pkgname=madwimax-mezon-svn
 pkgver=171
 pkgrel=1
 pkgdesc="MadWimax is a reverse-engineered linux driver for Mobile Wimax (802.16e) devices based on Samsung CMC-730 chip."
 arch=('i686' 'x86_64')
 url="http://code.google.com/p/madwimax/"
 license=('GPL2')
 depends=('bash' 'libusb1')
 makedepends=('subversion' 'asciidoc' 'docbook-xsl' 'docbook2x')
 optdepends=('dhclient')
 provides=('madwimax')
 install=${pkgname}.install
 source=(madwimax-change-ssid-for-mezon-modem.patch
	madwimax-mezon-svn.install)
 md5sums=('42f7766c21bda98d977dea23de158350'
         'd97f1644fab4121a3d4c9904aeb12c2a')
 
 _svnmod="madwimax"
 _svntrunk="http://madwimax.googlecode.com/svn/trunk/"
 
 build() {
  cd ${srcdir}
  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  cp -r ./$_svnmod ./$_svnmod-build
  cd ./$_svnmod-build

  #patch files for Arch Linux and MEZON network
  patch -Np2 -i $srcdir/madwimax-change-ssid-for-mezon-modem.patch || return 1
  #patch -Np2 -i $srcdir/madwimax-change-docbook-xsl-path.patch || return 1   
  
  autoreconf --install
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$pkgdir install || return 1

}
# vim:syntax=sh