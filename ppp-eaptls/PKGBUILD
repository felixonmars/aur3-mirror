# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Contributor: Viliam Pucik <viliam.pucik@gmail.com>
pkgname=ppp-eaptls
pkgver=2.4.5
pkgrel=3
pkgdesc="A daemon which implements the Point-to-Point Protocol for dial-up networking with EAP-TLS support"
arch=(i686 x86_64) 
url="http://www.samba.org/ppp/"
license=('custom:GPL/BSD')
groups=('base')
depends=('libpcap>=1.0.0' 'openssl')
backup=(etc/ppp/{chap-secrets,pap-secrets,options,ip-up,ip-down,eaptls-client,eaptls-server,openssl.cnf})
provides=('ppp')
conflicts=('ppp')
_pkgname=ppp
_eaptlsver=0.991
source=(ftp://ftp.samba.org/pub/ppp/ppp-${pkgver}.tar.gz
        http://www.nikhef.nl/~janjust/ppp/ppp-${pkgver}-eaptls-mppe-${_eaptlsver}.patch
        openssl.cnf
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
md5sums=('4621bc56167b6953ec4071043fe0ec57'
         '9079965cc533cecb35d77ab3cf52ea35'
         '321ba9134f0e2935c3b27390c257b875'
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
sha512sums=('3688720a0f9ee47802e72dc6aa3d47c7312c195007f37a6ceb087fdb6f1f77ad75e922a568cffed6d1a857f06d79460d6d38b56e179310e493a0380a0c5a4f6e'
            '756aab5109fe9e1f77f5397bad5a0f4a0026b1795b5fb7ff75c267d1a24284fd50458165a7b77ebbea7a85109990c3e3fb46f667926b7e02d33d1b53f708d6c9'
            '41d43ecf0f0d3a13f851f5121e59c50e54569fcd05d60173ab6de6d6e977aa0b091f7818e9db443adafad1a52e20116b9e6e4fb00c20277635487b30dafbd1ab'
            '86b13a9f02cc44c5ba16d404fdb54459fcda22fb5f4c4e12b2101e47e2650b62576d6315cd41f30f103ea61fb6f86b7aa2e7d40336f849f45061f7ad9c5119fe'
            '29233c8010f511792c2dcf54ee06ede271994ef029b6b526aeeb17433233ef6b638b96346d81db55c2a6bb25fb07633328415cd3af55dadd78a32b1d45b07dd8'
            '3605ce49bad21473ef5f3ff2421e1ef7687e9267986503deca63ae3a2baa6308e8d031cb1da2f93b5b73dc292206a49c59cea17b80c129272cc975e07e3c6142'
            '5fbf8b24eddc1f125bc8b75943530108ad9524833af3520862a5a38e037e0bf825810e202cd3b336400d902f3b565bc199731f14143021cd0ed2edc1b0487f37'
            'f40ab2549c2e05adc018197911c4820187aa5e9920004b0b1d68ebf38688a1fcab1f79966eb73f36237ec84f056ab9e0c05e32cbfd73fdd0c368216cf54741fd'
            'c5dc475940a34a2b489279f89d9b428b0e811abb6b22ef53b926784ab39e92981cd1eab79f8ff0c91de618c3bf890701fd7a8138537cdb036f8771e7ca16b5c4'
            'bdaaac792dd448ff31da6da2749d8c2f9c4e0311b1d4639de7c68038fcaa333cc28e25f5a6308de0ecb24b60b2e7284a811482df990da5f54d5581a746964f3c'
            'ea88d033e1c29e01f5a5c062bcdcfbf21b4ac057d3e58161cf80eee2800625f5c74cf1e8ed02f3e03ce708f459dd7698c9bf1a91bb46965cfc0a9f4c4c4469f3'
            '8d483f2a7112349db943a74647b912515d6a00df7a46928498b447b8cecdb5fb529802643de655fb9f9ecd3016872bfd338da5ba32718f1a612c868dae893252'
            'c64ef160ffeeca9356c89fbfcbe99ecef35b4e26590d8809f5bc4ec721b71ab955a39d817ecba36140cb37726463171a37776e9c5d23a24c6775547089e4b913')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 < ../ppp-${pkgver}-eaptls-mppe-${_eaptlsver}.patch
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
  
  # Fix build error with recent kernels
  rm include/linux/if_pppol2tp.h 

  ./configure --prefix=/usr
  make 
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/usr" install 
  install -D -m644 ../options "${pkgdir}/etc/ppp/options"
  install -D -m755 ../ip-up   "${pkgdir}/etc/ppp/ip-up"
  install -D -m755 ../ip-down "${pkgdir}/etc/ppp/ip-down"
  install -d -m755 "${pkgdir}/etc/ppp/ip-up.d"
  install -d -m755 "${pkgdir}/etc/ppp/ip-down.d"
  install -m755 ../ip-up.d.dns.sh   "${pkgdir}/etc/ppp/ip-up.d/00-dns.sh"
  install -m755 ../ip-down.d.dns.sh "${pkgdir}/etc/ppp/ip-down.d/00-dns.sh"
  install -D -m755 ../pon  "${pkgdir}/usr/bin/pon"
  install -D -m755 ../poff "${pkgdir}/usr/bin/poff"
  install -D -m755 ../plog "${pkgdir}/usr/sbin/plog"
  install -D -m600 etc.ppp/pap-secrets  "${pkgdir}/etc/ppp/pap-secrets"
  install -D -m600 etc.ppp/chap-secrets "${pkgdir}/etc/ppp/chap-secrets"
  install -D -m600 etc.ppp/eaptls-client "${pkgdir}/etc/ppp/eaptls-client"
  install -D -m600 etc.ppp/eaptls-server "${pkgdir}/etc/ppp/eaptls-server"
  install -D -m600 ../openssl.cnf "${pkgdir}/etc/ppp/openssl.cnf"
  install -D -m755 ${srcdir}/ppp "${pkgdir}/etc/rc.d/ppp"
  install -D -m644 ${srcdir}/pon.1 "${pkgdir}/usr/share/man/man1/pon.1"
  install -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m644 README* "${pkgdir}/usr/share/doc/${_pkgname}"
  install -d -m755 "${pkgdir}/etc/ppp/peers" 
  chmod 0755 "${pkgdir}/usr/lib/pppd/${pkgver}"/*.so
}
