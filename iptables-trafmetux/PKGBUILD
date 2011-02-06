# Contributor: Ashok `ScriptDevil` Gautham <ScriptDevil@gmail.com>

pkgname=iptables-trafmetux
_pkgname=iptables
pkgver=1.4.2
pkgrel=1
pkgdesc="A Linux kernel packet control tool"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.netfilter.org/"
depends=('glibc')
options=('!libtool')
conflicts=('iptables')
provides=('iptables')
source=(http://www.iptables.org/projects/iptables/files/iptables-$pkgver.tar.bz2 \
        iptables ip6tables empty.rules simple_firewall.rules iptables.conf.d iptables-1.4.2-trafmetux-0.1.6.patch)
md5sums=('a138d1c2e74321e0e4e228a9fb301c9a'
         '89401d6f0cf1de46a455b7be6720a58b'
         '6e0e88c2ed0c3715d1409ee3258a0046'
         '14186bbafe21bb0638c0cb8e0903c829'
         'e53a83bb4d8ac8b7eadd7bd58294751d'
         'c7cf6e4455c228e50d20ce3edd75ee59'
         '37f086f525b5037cf3f971a1f77e15e8'
         )

build() {
  cd $srcdir/$_pkgname-$pkgver
  cat $srcdir/iptables-1.4.2-trafmetux-0.1.6.patch | patch -p1

 ./configure --prefix=/usr --with-kernel=usr/src/linux-$(uname -r) \
	--libexecdir=/usr/lib/iptables --sysconfdir=/etc \
	--with-xtlibdir=/usr/lib/iptables \
	--enable-devel --enable-libipq

  make || return 1
  make DESTDIR=$pkgdir install || return 1 
  
  install -D -m755 ../iptables $pkgdir/etc/rc.d/iptables
  install -D -m755 ../ip6tables $pkgdir/etc/rc.d/ip6tables
  install -D -m644 ../empty.rules $pkgdir/etc/iptables/empty.rules
  install -D -m644 ../simple_firewall.rules $pkgdir/etc/iptables/simple_firewall.rules
  install -D -m644 ../iptables.conf.d $pkgdir/etc/conf.d/iptables
}
