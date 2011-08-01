pkgname=ppp-mppe-ubuntu
pkgver=2.4.5
_ubver=2.4.5-5ubuntu1
pkgrel=5
pkgdesc="A daemon which implements the PPP protocol for dial-up networking"
arch=(i686 x86_64)
url="http://www.samba.org/ppp/"
license=('custom:GPL/BSD')
depends=('glibc' 'libpcap>=1.0.0')
provides=('ppp=2.4.5')
conflicts=('ppp')
replaces=('ppp')
backup=(etc/ppp/{chap-secrets,pap-secrets,options,ip-up,ip-down})
source=(http://archive.ubuntu.com/ubuntu/pool/main/p/ppp/ppp_$pkgver.orig.tar.gz
	http://archive.ubuntu.com/ubuntu/pool/main/p/ppp/ppp_$_ubver.diff.gz
	http://gaute.vetsj.com/arkiv/2008-03-19%20-%20arch-mppc/ppp/ppp-2.4.4-mppe-mppc.1.1.patch
        options
	pon
	poff
	ppp
	plog
	pon.1
	ip-up
	ip-down
        ip-up.d.dns.sh
        ip-down.d.dns.sh)

build() {
  gzip -dc ppp_$_ubver.diff.gz | patch -Np1 
  cd $srcdir/ppp-$pkgver

  while read line ;do
    echo $line
    [ -n "$line" ] &&  [ `expr "$line" : '#'` = "0"  ] && patch -Np1 -i $srcdir/debian/patches/$line
  done < $srcdir/debian/patches/series

  patch -p1 -i ../ppp-2.4.4-mppe-mppc.1.1.patch || return 1

  # fix CFLAGS
  # -D_GNU_SOURCE is needed for IPv6 to work apparently
  export CFLAGS="$CFLAGS -D_GNU_SOURCE"
  sed -i "s:-O2 -pipe -Wall -g:${CFLAGS}:" pppd/Makefile.linux
  sed -i "s:-g -O2:${CFLAGS}:" pppd/plugins/Makefile.linux
  sed -i "s:-O2:${CFLAGS}:" pppstats/Makefile.linux
  sed -i "s:-O2 -g -pipe:${CFLAGS}:" chat/Makefile.linux
  sed -i "s:-O:${CFLAGS}:" pppdump/Makefile.linux

  # enable active filter
  sed -i "s:^#FILTER=y:FILTER=y:" pppd/Makefile.linux
  # enable ipv6 support
  sed -i "s:^#HAVE_INET6=y:HAVE_INET6=y:" pppd/Makefile.linux
  # Enable Microsoft proprietary Callback Control Protocol
  sed -i "s:^#CBCP=y:CBCP=y:" pppd/Makefile.linux 

  ./configure --prefix=/usr
  make all || return 1
  make DESTDIR=$pkgdir/usr install || return 1
  install -D -m644 $srcdir/options $pkgdir/etc/ppp/options || return 1
  install -D -m755 $srcdir/ip-up $pkgdir/etc/ppp/ip-up || return 1
  install -D -m755 $srcdir/ip-down $pkgdir/etc/ppp/ip-down || return 1
  install -d -m755 $pkgdir/etc/ppp/ip-up.d || return 1
  install -d -m755 $pkgdir/etc/ppp/ip-down.d || return 1
  install -m755 $srcdir/ip-up.d.dns.sh $pkgdir/etc/ppp/ip-up.d/00-dns.sh || return 1
  install -m755 $srcdir/ip-down.d.dns.sh $pkgdir/etc/ppp/ip-down.d/00-dns.sh || return 1
  install -D -m755 $srcdir/pon $pkgdir/usr/bin/pon || return 1
  install -D -m755 $srcdir/poff $pkgdir/usr/bin/poff || return 1
  install -D -m755 $srcdir/plog $pkgdir/usr/sbin/plog || return 1
  install -D -m600 etc.ppp/pap-secrets $pkgdir/etc/ppp/pap-secrets  || return 1
  install -D -m600 etc.ppp/chap-secrets $pkgdir/etc/ppp/chap-secrets || return 1
  install -D -m755 $srcdir/ppp $pkgdir/etc/rc.d/ppp  || return 1
  install -D -m644 $srcdir/pon.1 $pkgdir/usr/share/man/man1/pon.1 || return 1
  install -d -m755 $pkgdir/etc/ppp/peers || return 1
}
md5sums=('4621bc56167b6953ec4071043fe0ec57'
         'cd6999b5e252d5da3a985bf8cd8e135d'
         '104fec88d3c79472f30a2950a577773b'
         '7a9259a8f038073eeea7e4552ff1849f'
         '48c024f73a80c8b69c4def22f86902cc'
         '2d811f8470ccdea3b8c4505a438483e9'
         '7561c73b557292d5ba1a9c5dbd270fde'
         '86cdaf133f7a79fb464f02d83afc7734'
         '44cc662ba9aa61dd9add3ddd4c5ded57'
         'e4beb16ed600b61336d50b2bd2df7cd5'
         '2fa0671f40711e69194ccf60979f8b33'
         '4a074d74c29625b254a1db720cb87b99'
         '8d1be5af8e46393ba6eb273377831e38')
