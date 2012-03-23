# Maintainer: Brad <bradla8 at yahoo.com>

pkgname=racoon2
pkgver=20100526a
pkgrel=1
pkgdesc="Racoon2 ipsec"
arch=('i686' 'x86_64')
url="http://www.racoon2.wide.ad.jp/w/"
license=('BSD')
groups=('')
depends=('glibc')
source=(http://ftp.racoon2.wide.ad.jp/pub/racoon2/$pkgname-$pkgver.tgz
	racoon2.patch)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 < $srcdir/racoon2.patch
  ./configure  --prefix=/usr

  make

  install -c  -d ${pkgdir}/usr/sbin
  install -c  spmd/spmd ${pkgdir}/usr/sbin
  install -c  spmd/spmdctl ${pkgdir}/usr/sbin
  install -c  -d ${pkgdir}/usr/man/man8
  install -c  -m 644 spmd/spmd.8 spmd/spmdctl.8 ${pkgdir}/usr/man/man8
  install -c  -d ${pkgdir}/usr/sbin
  install -c  iked/iked ${pkgdir}/usr/sbin
  install -c  -d ${pkgdir}/usr/man/man8

  install -c  -d ${pkgdir}/usr/sbin
  install -c  kinkd/kinkd ${pkgdir}/usr/sbin
  install -c  -d ${pkgdir}/usr/man/man8
  install -c  pskgen/pskgen ${pkgdir}/usr/sbin
  install -c  -m 644 pskgen/pskgen.8 ${pkgdir}/usr/man/man8
  install -c  -d ${pkgdir}/etc/racoon2
  sh pskgen/autogen.spmd.pwd
  install -c  -d ${pkgdir}/etc/rc.d
  install -c  samples/init.d-iked ${pkgdir}/etc/rc.d/iked

  install -c  samples/init.d-kinkd ${pkgdir}/etc/rc.d/kinkd
  install -c  samples/init.d-spmd ${pkgdir}/etc/rc.d/spmd
  install -c  -d ${pkgdir}/etc/racoon2
  install -c  -m 600 samples/racoon2.conf ${pkgdir}/etc/racoon2/racoon2.conf.sample
  install -c  -m 600 samples/vals.conf ${pkgdir}/etc/racoon2/vals.conf.sample
  install -c  -m 600 samples/default.conf ${pkgdir}/etc/racoon2/default.conf.sample
  install -c  -m 600 samples/transport_ike.conf ${pkgdir}/etc/racoon2/transport_ike.conf.sample
  install -c  -m 600 samples/tunnel_ike.conf ${pkgdir}/etc/racoon2/tunnel_ike.conf.sample
  install -c  -m 600 samples/tunnel_ike_natt.conf ${pkgdir}/etc/racoon2/tunnel_ike_natt.conf.sample
  install -c  -m 600 samples/transport_kink.conf ${pkgdir}/etc/racoon2/transport_kink.conf.sample
  install -c  -m 600 samples/tunnel_kink.conf ${pkgdir}/etc/racoon2/tunnel_kink.conf.sample
  install -c  -m 600 samples/local-test.conf ${pkgdir}/etc/racoon2/local-test.conf.sample
  install -c  -d -m 700 ${pkgdir}/etc/racoon2/psk
  install -c  -d -m 700 ${pkgdir}/etc/racoon2/cert
  install -c  -d ${pkgdir}/etc/racoon2/hook
  install -c  -m 644 samples/functions ${pkgdir}/etc/racoon2/hook
  install -c  -d ${pkgdir}/etc/racoon2/hook/ikesa-up.d
  install -c  samples/ikesa-up ${pkgdir}/etc/racoon2/hook
  install -c  -d ${pkgdir}/etc/racoon2/hook/ikesa-down.d
  install -c  samples/ikesa-down ${pkgdir}/etc/racoon2/hook
  install -c  -d ${pkgdir}/etc/racoon2/hook/ikesa-rekey.d
  install -c  samples/ikesa-rekey ${pkgdir}/etc/racoon2/hook
  install -c  -d ${pkgdir}/etc/racoon2/hook/child-up.d
  install -c  samples/child-up ${pkgdir}/etc/racoon2/hook
  install -c  -d ${pkgdir}/etc/racoon2/hook/child-down.d
  install -c  samples/child-down ${pkgdir}/etc/racoon2/hook
  install -c  -d ${pkgdir}/etc/racoon2/hook/child-rekey.d
  install -c  samples/child-rekey ${pkgdir}/etc/racoon2/hook
  install -c  -d ${pkgdir}/etc/racoon2/hook/migration.d
  install -c  samples/migration ${pkgdir}/etc/racoon2/hook
  install -c  samples/00ikesaup_sample ${pkgdir}/etc/racoon2/hook/ikesa-up.d
  install -c  samples/00childup_sample ${pkgdir}/etc/racoon2/hook/child-up.d
  install -c  -d ${pkgdir}/etc/racoon2/hook/ph1-up.d
  install -c  samples/ph1-up ${pkgdir}/etc/racoon2/hook
  install -c  -d ${pkgdir}/etc/racoon2/hook/ph1-down.d
  install -c  samples/ph1-down ${pkgdir}/etc/racoon2/hook
  install -c  -d -o 0 -g 0 -m 700 ${pkgdir}/var/run/racoon2

#  make DESTDIR=${pkgdir}/ install
#  for d in lib spmd iked kinkd pskgen samples ; do \
#        if test -d $d ; then \
#                echo "===> Change directory to $d" ; \
#                (cd $d && make DESTDIR=${pkgdir} install) || exit 1 ; \
#        fi ; done

}
md5sums=('2fa33abff1ccd6fc22876a23db77aaa8'
         '944dabc59525847908ef2aeb5b765e35')
