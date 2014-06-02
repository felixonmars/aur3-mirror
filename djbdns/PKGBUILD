# Contributor: Yejun Yang  yejunx AT gmail DOT com
# Feb 8th, 2009
# rel 6: Allow nsd as slaves
# rel 5: Increase txt record length to 255
# rel 4: Fixed http://article.gmane.org/gmane.network.djbdns/13864
# rel 3: Patch IPv6, IXFR, MMAP cache and man pages.
# rel 2: Fixed the regex to get root hints file and added desc.

pkgname=djbdns
pkgver=1.05
pkgrel=10
pkgdesc="Tinydns and dnscache"
arch=('i686' 'x86_64')
url="http://cr.yp.to/djbdns.html"
license=('Public domain')
depends=('daemontools' 'ucspi-tcp')
makedepends=('wget' 'gawk')
install=djbdns.install
source=("http://cr.yp.to/djbdns/$pkgname-$pkgver.tar.gz"
	'http://www.fefe.de/dns/djbdns-1.05-test23.diff.bz2'
	'http://www.fefe.de/dns/djbdns-1.05-ixfr.diff.gz'
#   'http://tinydns.org/one-second.patch'
#	'http://safari.iki.fi/djbdns/djbdns-1.05-epoll-latest.diff.bz2'
#	'http://tinydns.org/srv-patch'
	'http://smarden.org/pape/djb/manpages/djbdns-1.05-man.tar.gz'
	'http://www.internic.net/zones/named.root'
	'axfred.patch'
	'txt.patch'
	'ipv6intremove.patch'
	'nsd-xfr.patch')

md5sums=('3147c5cd56832aa3b41955c7a51cbeb2'
         'dc35e88e20ffe2670cef5bb4d8a2c183'
         'd66d9304a479ad0daa144c788a7ae997'
         '14d7329cff69f604fac607436eb8485e'
         'c1d30572b84d48ddd56c2b4a7e5dacc2'
         'b3d5b1f23f65eb862b5667525ee3fb24'
         'a2a64986133d3e205a08cb275ca35669'
         '373d8370856e8e44b53aeadf5cae8e51'
         '9ea8e388431e319a18e95b16200d0562')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  echo gcc $CFLAGS -include /usr/include/errno.h > conf-cc
  echo /usr > conf-home
  patch -p0 < ../txt.patch || return 1
  patch -p1 < ../djbdns-1.05-test23.diff || return 1
  patch -p1 < ../ipv6intremove.patch || return 1
  patch -p1 < ../djbdns-1.05-ixfr.diff || return 1
  patch -p0 < ../axfred.patch || return 1
  patch -p0 < ../nsd-xfr.patch || return 1
  make || return 1
  mkdir -p ${pkgdir}/usr/bin ${pkgdir}/etc || return 1
  
  for f in dnscache-conf tinydns-conf walldns-conf rbldns-conf pickdns-conf \
           axfrdns-conf dnscache tinydns walldns rbldns pickdns axfrdns \
           tinydns-get tinydns-data tinydns-edit rbldns-data pickdns-data \
           axfr-get; do
      install -m755 $f ${pkgdir}/usr/bin/ || return 1
  done
    
  for f in dnsip dnsipq dnsname dnstxt dnsmx dnsfilter random-ip dnsqr dnsq dnstrace \
           dnstracesort; do
      install -m755 $f ${pkgdir}/usr/bin/ || return 1
  done
  cat $srcdir/named.root | awk --posix '/\.ROOT-SERVERS\.NET.*[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/ { print $4; }' > dnsroots.global || return 1
  install -m644 dnsroots.global ${pkgdir}/etc || return 1

  cd "$srcdir/djbdns-man" || return 1
  gzip *.1 *.5 *.8 || return 1
  mkdir -p ${pkgdir}/usr/share/man/man1 ${pkgdir}/usr/share/man/man5 ${pkgdir}/usr/share/man/man8 || return 1
  install -m644 *.1.gz ${pkgdir}/usr/share/man/man1
  install -m644 *.5.gz ${pkgdir}/usr/share/man/man5
  install -m644 *.8.gz ${pkgdir}/usr/share/man/man8
}
