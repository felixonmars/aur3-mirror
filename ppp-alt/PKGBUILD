pkgname=ppp-alt
pkgver=2.4.2
pkgrel=1
pkgdesc="A daemon which implements the PPP protocol for dial-up networking"
arch=(i686 x86_64) 
url="http://www.samba.org/ppp/"
depends=('glibc' 'libpcap')
conflicts=(ppp)
provides=(ppp)
backup=(etc/ppp/{chap-secrets,pap-secrets,options,ip-up,ip-down})
source=(ftp://ftp.samba.org/pub/ppp/ppp-$pkgver.tar.gz \
        options pon poff ppp plog pon.1 ip-up ip-down \
	ppp-2.4.2-alt-makefile.patch \
        ppp-2.4.2-alt-pppd-lock.patch \
        ppp-2.4.2-alt-pppd-noresolv.patch \
        ppp-2.3.11-alt-scripts-fixes.patch \
        ppp-2.4.1-alt-scripts-callback.patch \
        ppp-2.4.2-alt-opts.patch \
        ppp-2.4.2-asp-cbcp-mps.patch \
        ppp-20031003-alt-cleardefaultroute.patch \
	ppp-2.4.2-alt-optsigsegv.patch \
	ppp-2.4.2-alt-killmypg.patch \
	ppp-2.4.2-alt-holdoffhack.patch \
	ppp-2.4.2-lib64.patch \
	ppp-2.4.2-fix64.patch)
md5sums=('362bcf218fba8afbb9afbee7471e5dac' '7a9259a8f038073eeea7e4552ff1849f'\
         '48c024f73a80c8b69c4def22f86902cc' '2d811f8470ccdea3b8c4505a438483e9'\
	 '7561c73b557292d5ba1a9c5dbd270fde' '86cdaf133f7a79fb464f02d83afc7734'\
	 '44cc662ba9aa61dd9add3ddd4c5ded57' 'fac0c773490371ea673f4be0977a230f'\
	 'a88b40b1bf91eb5cca3762b7195e4fe2' 'edbd4a6e4dd54f6b45c0c74810fcbbca'\
	 '8533c0b631130648e3ceb28831b297a6' 'd77f3852229ae7123c33cdfc0ac0bc9e'\
	 '809e385f994bfbbf7597157d59bfb6de' 'c57fc2ba56c5b72a7fb51be6d59af0b3'\
         '6027fdef65aaa7cd1238089faa506e3a' '3c274c165ffdc74c547ad2b02484ecf6'\
         'fa9ab89b1a6ec1978ccc43cabacf41cf' 'ec1bef7bf0e2331512c1a0ce4e62b6fa'\
         'ad6a81f665d6ea2e2aee8678fc9f2097' 'a9d95a8475b0e2524c1950b28d6a29de'\
         '866c54a48d3eeb308d1e74eb1db12122' '9c4950b0a672e315e09e845ed9397eed')

build() {
  cd $startdir/src/ppp-$pkgver

  patch -Np1 <../ppp-2.4.2-alt-makefile.patch
  patch -Np1 <../ppp-2.4.2-alt-pppd-lock.patch
  patch -Np1 <../ppp-2.4.2-alt-pppd-noresolv.patch
  patch -Np1 <../ppp-2.3.11-alt-scripts-fixes.patch
  patch -Np1 <../ppp-2.4.1-alt-scripts-callback.patch
  patch -Np1 <../ppp-2.4.2-alt-opts.patch
  patch -Np1 <../ppp-2.4.2-asp-cbcp-mps.patch
  patch -Np1 <../ppp-20031003-alt-cleardefaultroute.patch
  patch -Np1 <../ppp-2.4.2-alt-optsigsegv.patch
  patch -Np1 <../ppp-2.4.2-alt-killmypg.patch
  patch -Np1 <../ppp-2.4.2-alt-holdoffhack.patch
  patch -Np1 <../ppp-2.4.2-lib64.patch
  patch -Np1 <../ppp-2.4.2-fix64.patch

  # fix CFLAGS
  sed -i "s:-O2 -pipe -Wall -g:${CFLAGS}:" pppd/Makefile.linux
  sed -i "s:-g -O2:${CFLAGS}:" pppd/plugins/Makefile.linux
  sed -i "s:-O2:${CFLAGS}:" pppstats/Makefile.linux
  sed -i "s:-O2 -g -pipe:${CFLAGS}:" chat/Makefile.linux
  sed -i "s:-O:${CFLAGS}:" pppdump/Makefile.linux

  # enable active filter
  sed -i "s:^#FILTER=y:FILTER=y:" pppd/Makefile.linux
  sed -i "s:^#CBCP=y:CBCP=y:" pppd/Makefile.linux
  sed -i "s:^LIBS = -lutil:LIBS = -lutil -lcrypt:" pppd/Makefile.linux

  ./configure --prefix=/usr
  make libdir=/usr/lib || return 1
  make libdir=/usr/lib DESTDIR=$startdir/pkg install
  install -D -m644 $startdir/src/options $startdir/pkg/etc/ppp/options
  install -D -m755 $startdir/src/ip-up $startdir/pkg/etc/ppp/ip-up
  install -D -m755 $startdir/src/ip-down $startdir/pkg/etc/ppp/ip-down
  install -D -m755 $startdir/src/pon $startdir/pkg/usr/bin/pon
  install -D -m755 $startdir/src/poff $startdir/pkg/usr/bin/poff
  install -D -m755 $startdir/src/plog $startdir/pkg/usr/sbin/plog
  install -D -m600 etc.ppp/pap-secrets $startdir/pkg/etc/ppp/pap-secrets
  install -D -m600 etc.ppp/chap-secrets $startdir/pkg/etc/ppp/chap-secrets
  install -D -m755 $startdir/src/ppp $startdir/pkg/etc/rc.d/ppp 
  install -D -m644 $startdir/src/pon.1 $startdir/pkg/usr/man/man1/pon.1
  mkdir -p $startdir/pkg/etc/ppp/peers
}
