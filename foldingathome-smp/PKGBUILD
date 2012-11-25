# Contributor: Johannes Sjolund <j.sjolund_AT_gmail.com>
# Contributor: Jason Taylor <jftaylor21_AT_gmail>
# Contributor: seratne
# Contributor: kozaki <kozaki_AT_guides>
# Maintainer: smartcat99s <xraytux_AT_gmail>

pkgname=foldingathome-smp
pkgver=6.34
pkgrel=4
pkgdesc="Folding@Home SMP (x86_64 only) is a distributed computing project which studies protein folding, misfolding, aggregation, and related diseases."
arch=(x86_64)
url="http://folding.stanford.edu/"
license=('CUSTOM')
depends=('glibc')
backup=('etc/conf.d/foldingathome-smp')
install=foldingathome-smp.install
source=(http://www.stanford.edu/group/pandegroup/folding/release/FAH$pkgver-Linux64.tgz
		foldingathome-smp.rc.d 
		foldingathome-smp.conf.d
		foldingathome-smp.service)

build() {
  cd "$srcdir"

  install -D -c -m755 fah6 "$pkgdir"/opt/fah-smp/fah6
  #install -D -c -m755 mpiexec $pkgdir/opt/fah-smp/mpiexec
  install -D -c -m755 "$srcdir"/foldingathome-smp.rc.d "$pkgdir"/etc/rc.d/foldingathome-smp
  install -D -c -m644 "$srcdir"/foldingathome-smp.conf.d "$pkgdir"/etc/conf.d/foldingathome-smp
  install -D -c -m644 "$srcdir"/foldingathome-smp.service "$pkgdir"/usr/lib/systemd/system/foldingathome-smp.service

  chmod 755 ./fah6
  ./fah6 -license >COPYING
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
md5sums=('adb1d9fe89b141da4f4f0b639c04b0bf'
         '7dd750a9cc0f4ae9400068cffc2b6126'
         '7f1fce6ad413358a2b1ac21860b1c97e'
         '6e02106278028dec82d278722cb3c2eb')
sha1sums=('9150b81381a180fde2d81a27784bbb511bf66ea5'
          '7eacb9d7a69477943d90609518536bffe0ad7142'
          '6d7dcc2742976b04bb47bb511b6fadc19102dbee'
          '62e987044c4c7513eb5ac4a8a0dc9a5e02fc24df')
sha256sums=('8b4d47f2ac711bd487235c7f015df7420d9581d199b26479ef312b45e52c8a95'
            '15a2bc9307973e26f53a7a00b62ee0fde490019233ab5d3d8ff6f23af840fa9a'
            'faf1c1b888e07c5d64ce0fcfbe0927019f6609acb5cd7d6f8e1ced8e329c1aec'
            '9316ed1c95227e8ec7762d9c66cdff2a7c6919435c4b20ed88d8841afc6730b3')
sha512sums=('73872a7886eee486b4d71aeaed9b29a795f1a90866b677a38833ccc97caeed14139b1f8dcc525ef12182df00be4fb3c2cc24dcd8d1c92162e1e7d89a4d72059b'
            '3eb2db3a6aeaf6f1e20ecbc796aaf4a77655c73ddcc98adc1a95bb3b7e68a9bc7dc6b906b7a06f13cc3ff292f3d19da6f8596687e2d9f615a7786b2008d1b3a7'
            '08532a09e0251feb6ab25bb7837e025543b328562f285e8a1fae4c90b410c4e938f0cd09c62e85a9df960a5ff896a71b6f342c3f82613630048bab59fc730c8b'
            'e69abc44ec7cc480e36db824f33fe446284bb2ea85605dda933c528279de3a2f63d3d1e58a5b45025ca763c1e3b1f3a6c642fd0e1f5373e2ee85a9d2f3094712')
