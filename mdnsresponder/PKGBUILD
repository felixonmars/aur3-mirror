# Maintainer: SJ_UnderWater

pkgname=mdnsresponder
true && pkgname=('mdnsresponder' 'nss-mdnsresponder')
pkgver=379.38.1
pkgrel=1
pkgdesc="Apple's official implementation of mDNS/DNS-SD/Bonjour/Zeroconf"
arch=('i686' 'x86_64')
url='https://developer.apple.com/opensource/'
license=('CUSTOM')
depends=('glibc')
options=('!libtool')
install=$pkgname.install
changelog=$pkgname.changelog
source=(dnsextd.rc mdnsd.rc nss-mdnsresponder.install \
	http://www.opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-$pkgver.tar.gz)
md5sums=('4162d5c457b4dcdf79dc6e75d5cc1977'
	'bcaaabccb30111573e36c750341db78c'
	'fa87aeb60f79a34fe26d570c16494844'
	'6b67ccfc374f0d4aa68f5de7c21e6871')

build() {
	if [ "$(echo $srcdir|grep -E '[ "]')" ];then
	error 'Spaces found in path, this will break the Makefile';exit 1;fi
	cd mDNSResponder-$pkgver/mDNSPosix
	if [ ! -f fixed ];then fix;fi
	msg2 'Making...'
	make os=linux
}
fix() {
	msg2 'Fixing Makefile...'
	sed -i 's:-d $<:-d $<\n\tsed -i "s,yyparse (void),yyparse (void *context)," $(OBJDIR)/$*.c:' Makefile
	sed -i 's:-Wall -D:-Wall -Wno-unused-but-set-variable -D:' Makefile
	sed -i 's/CP = cp/CP = install -D/' Makefile
	sed -i 's/LN = ln -s -f/LN = ln -rs/' Makefile
	sed -i 's/cp \$/$(CP) $/' Makefile
	sed -i 's;NSSINSTPATH := ;NSSINSTPATH := $(DESTDIR)/usr;' Makefile
	sed -i 's/INSTBASE?=/INSTBASE?=$(DESTDIR)/' Makefile
	sed -i 's/STARTUPSCRIPTNAME?=mdns/STARTUPSCRIPTNAME?=mdnsd/' Makefile
	sed -i 's/MANPATH := /MANPATH := $(DESTDIR)/' Makefile
	sed -i 's:STARTUPSCRIPTDIR = $(INSTBASE)/etc/rc.d:STARTUPSCRIPTDIR = $(DESTDIR)/etc/rc.d:' Makefile
	sed -i 's:/etc/nss_mdns.conf:$(DESTDIR)/etc/nss_mdns.conf:' Makefile
	sed -i 's/cp -f/#cp -f/' Makefile
	sed -i 's/sed -e/#sed -e/' Makefile
	sed -i 's/\tldconfig/\t#ldconfig/' Makefile
	sed -i 's/\$@ start/#$@ start/' Makefile
	echo -e '\n$(STARTUPSCRIPTDIR): $(DESTDIR)\n\tmkdir -p $<' >>Makefile
	:>fixed
}
package_mdnsresponder() {
	backup=('etc/dnsextd.conf')
	cd mDNSResponder-$pkgver/mDNSPosix
	msg2 'Building...'
	make os=linux DESTDIR="$pkgdir" OPTINSTALL= install
	install -m755 "$srcdir"/dnsextd.rc "$pkgdir"/etc/rc.d/dnsextd
	install -m755 "$srcdir"/mdnsd.rc "$pkgdir"/etc/rc.d/mdnsd
	install -d "$pkgdir"/usr/share/man/man1
	install -D -m444 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -m444 ../mDNSShared/dns-sd.1 "$pkgdir"/usr/share/man/man1/
	install -m444 ../mDNSShared/dnsextd.8 "$pkgdir"/usr/share/man/man8
	install -m444 ../mDNSShared/dnsextd.conf "$pkgdir"/etc
	cp build/prod/mDNS{Identify,NetMonitor} "$pkgdir"/usr/bin
	cp build/prod/mDNS{Client,Responder,ProxyResponder}Posix "$pkgdir"/usr/bin
	cp build/prod/dnsextd "$pkgdir"/usr/sbin
}
package_nss-mdnsresponder() {
	provides=('nss-mdns');conflicts=(${provides[@]});backup=('etc/nss_mdns.conf')
	true && pkgdesc="Apple's official implementation of mdns host name resolution"
	install=$pkgname.install
	cd mDNSResponder-$pkgver/mDNSPosix
	msg2 'Building...'
	make os=linux DESTDIR="$pkgdir" InstalledNSS
	install -D -m444 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
