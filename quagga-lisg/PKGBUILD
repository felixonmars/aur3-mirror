#
# quagga routing suite PKGBUILD
#
# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: shild <shildv@gmail.com> 
# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>
# Contributor: Bart Kos, bro at fast-stable-secure dot net
# Contributor: HomeCreate <homecreate@list.ru>
# Contributor: Damjan Georgievski, gdamjan at gmail dot com
#

pkgname=quagga-lisg
pkgver=0.99.20
pkgrel=1
pkgdesc="Advanced routing protocol suite. Includes BGP4 OSPF2 OSPF3 RIP protocols implementations. Version patched for use with lISG"
arch=('i686' 'x86_64')
url="http://www.quagga.net"
license=('GPL2')
depends=('libcap>=2.17' 'libnl' 'net-snmp' 'readline>=6.0.003-3' 'iproute' 'cpulimit' 'autoconf')
replaces=('quagga')
backup=('etc/quagga.d/zebra.conf' 'etc/quagga.d/ripd.conf' 'etc/quagga.d/ripngd.conf' 'etc/quagga.d/ospfd.conf' 'etc/quagga.d/ospf6d.conf' 'etc/quagga.d/bgpd.conf' 'etc/conf.d/quagga')
install=quagga.install

source=(http://www.quagga.net/download/quagga-$pkgver.tar.gz zebra ripd ripngd ospfd ospf6d bgpd quagga.conf 
        patch-ipforward_sysctl.c.patch patch-Makefile.in.patch quagga-kernel-blackhole-add.diff)
md5sums=('64cc29394eb8a4e24649d19dac868f64'
         '0bb8662ffb60106ca5476b559afe6fa9'
         '892055cfd46b7bd89fd13cf4c446c07e'
         '12075ca726cb8e401f601b17f375b88e'
         '5069f9e6ade2e1acc9335da38b2be310'
         'f44cdb3354e8bd70039cab07c3363cf4'
         '83327d4d078a8d90b7e8e3c3f90b92e8'
         '1fd63dc935eece30d871c7d007b1c432'
         '76ae0de530e7ef287507f0e4b3bbe4ed'
         'a16065f40a229e711d0a0e37340eff15'
         'b0c15be157952f2bf05f5c6a07f249fc')

build() {
    cd $srcdir/quagga-$pkgver

  msg "Patching..."
  # ipv6 patch
  cat $srcdir/patch-ipforward_sysctl.c.patch | patch -p1
  # reordering libs patch
  cat $srcdir/patch-Makefile.in.patch | patch -p1
  # blackhole patch
  cat $srcdir/quagga-kernel-blackhole-add.diff | patch -p1

  msg "Configuring..."
  ./configure --prefix=/usr \
		--sysconfdir=/etc/quagga.d \
		--localstatedir=/var/lib/quagga \
		--enable-ipv6 \
		--enable-snmp \
		--enable-netlink \
		--enable-tcp-zebra \
		--enable-opaque-lsa \
		--enable-ospf-te \
		--enable-multipath=0 \
		--enable-user=quagga \
		--enable-group=quagga \
		--enable-irdp \
		--enable-pcreposix \
		--enable-rtadv \
    --enable-vtysh
    
    msg "Building..."
    make

    msg "Installing..."
    make DESTDIR=$pkgdir PREFIX=$pkgdir install

    for line in bgpd ospfd ospf6d zebra ripd ripngd
    do
  	install -D -m 755 -o root -g root $srcdir/$line $pkgdir/etc/rc.d/$line
	
	  touch $pkgdir/etc/quagga.d/$line.conf
	  echo "password quagga" > $pkgdir/etc/quagga.d/$line.conf
    done

    mkdir -p $pkgdir/etc/conf.d
    install -D -m 644 -o root -g root $srcdir/quagga.conf $pkgdir/etc/conf.d/quagga

    chmod 775 $pkgdir/etc/quagga.d
    rm $pkgdir/usr/share/info/dir
    
    mkdir -p $pkgdir/var/lib/quagga
    chmod 775 $pkgdir/var/lib/quagga
    mkdir -p $pkgdir/var/log/quagga
    
    rm $pkgdir/usr/lib/{libospfapiclient,libospf,libzebra}.la
}

# vim:set ts=2 sw=2 et:
