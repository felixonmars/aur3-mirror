# Contributor: Paul Ezvan <paul@ezvan.fr>

_kernver=`uname -r`;
_iptablesver=`pacman -Q iptables | sed "s/iptables //" | sed "s/-[1-9]//"`;

pkgname=ipp2p
pkgver=0.8.2
pkgrel=6
pkgdesc="IPP2P is a netfilter P2P traffic matching module."
arch=('i686' 'x86_64')
url="http://www.ipp2p.org/"
license=('GPL')
depends=('iptables=1.4.5' 'kernel26>=2.6.28-1' 'kernel26<=2.6.32-1')
# Enable this with kernel26=2.6.32-1
#makedepends=('kernel26-headers')
install=$pkgname.install
source=(http://www.ipp2p.org/downloads/$pkgname-$pkgver.tar.gz
        http://www.iptables.org/projects/iptables/files/iptables-$_iptablesver.tar.bz2
        ipp2p-0.8.2-iptables-1.4.0.patch
        ipp2p-0.8.2-iptables-1.4.1.patch
        ipp2p-0.8.2-iptables-1.4.3.patch
        ipp2p-0.8.2-kernel-2.6.22.patch
        ipp2p-0.8.2-kernel-2.6.28.patch
        makefile.diff)
md5sums=('9dd745830f302d70d0b728013c1d6a0c'
         '44f13990132c20299c1994cd6f425140'
         'cec8b0e26d4354024e2e8eceb4a06d09'
         '0e336f36f6e66ea9ddb217fba8215bdd'
         '6607a84dd1aad3eb85a5df2458a75191'
         '4bcce76d2a996de9c62a3d8a183eea0e'
         '7ec3d52a2f340f06746466d1ce59f8e9'
         '1d807906e0632d9d7a429d1f4c219da0')
build() {
  cd "$srcdir"
  mv "iptables-$_iptablesver" "iptables"
  cd "iptables"
  ./configure
  
  cd "$srcdir/$pkgname-$pkgver"

  patch -p0 -i ../makefile.diff || return 1
  patch -p1 -i ../ipp2p-0.8.2-iptables-1.4.0.patch || return 1
  patch -p1 -i ../ipp2p-0.8.2-iptables-1.4.1.patch || return 1
  patch -p0 -i ../ipp2p-0.8.2-iptables-1.4.3.patch || return 1
  patch -p1 -i ../ipp2p-0.8.2-kernel-2.6.22.patch || return 1
  patch -p1 -i ../ipp2p-0.8.2-kernel-2.6.28.patch || return 1
  make || return 1
  install -m 755 -D libipt_ipp2p.so $startdir/pkg/usr/lib/iptables/libipt_ipp2p.so
  install -m 644 -D ipt_ipp2p.ko $startdir/pkg/lib/modules/$_kernver/kernel/net/ipv4/netfilter/ipt_ipp2p.ko

}

# vim:set ts=2 sw=2 et:
