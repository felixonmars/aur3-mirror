# Contributor: Det
# Contributor: Guillaume ALAUX <guillaume at alaux dot net>

pkgname=derby
pkgver=10.10.1.2
pkgrel=2
pkgdesc="Oracle's distribution of the open source Apache Derby Java database"
arch=('any')
url=http://docs.oracle.com/javadb/index.html
license=('APACHE')
depends=('java-derby')
backup=('etc/derby.conf')
# scripts bundled in (at location jdk-*/db/bin/):
# http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
source=('derby.conf'
        'derby.service'
        'derby.sh'
        'derby.csh'
        'script-NetworkServerControl'
        'script-dblook'
        'script-ij'
        'script-setEmbeddedCP'
        'script-setNetworkClientCP'
        'script-setNetworkServerCP'
        'script-startNetworkServer'
        'script-stopNetworkServer'
        'script-sysinfo'
        '3RDPARTY'
        'LICENSE'
        'NOTICE'
        'README-JDK.html'
        'RELEASE-NOTES.html')
md5sums=('4bdff6982c66d24a879c424aaac3d04d'
         '77f3b7ddf55c112f97a665a825bf764f'
         '8b0db7c5cef58211b8b43a1524985ec2'
         'c9f9de436d068452bdb611b88d6e4290'
         'e8dcb44116747b9349a832f2c296c6e0'
         'b8aef52b713dda8636d509456e3a26e0'
         '45b17e202c7d7b2099c49c31a0665f9e'
         '5bff1c12ef49b02702b15583f7d58eae'
         '443e4d3012545d1e660d04d2d3e9e5f1'
         'b9ee02c3030127fce2d99a3cd8a24425'
         '3d6709dcee612e182c0628f143a0171a'
         'b08b48acebe50ead5a3aa36f7efaf232'
         'ec19453c44ea007a2bb786db8eb37351'
         'a98ab5c9879aeb8eebe98fd1da901bd8'
         'd273d63619c9aeaf15cdaf76422c4f87'
         'f36f001d631e4d04cb79a7d84c5d432b'
         'e4b27372d72fbcb2c1e372c53f5c83d6'
         'bd326d621b896e11d73d930a66e4752a')

package() {
  # scripts
  for i in script-*; do
    install -Dm755 $i "$pkgdir"/usr/share/java/$pkgname/bin/${i/*-}
  done

  # workaround link: lib/ -> ../
  ln -sf /usr/share/java/$pkgname "$pkgdir"/usr/share/java/$pkgname/lib

  # conf
  install -Dm644 derby.conf "$pkgdir"/etc/derby.conf

  # profile.d
  for i in *.{,c}sh; do
    install -Dm644 $i "$pkgdir"/etc/profile.d/$i
  done

  # service
  install -Dm644 derby.service "$pkgdir"/usr/lib/systemd/system/derby.service

  # licenses
  for i in *.html 3RDPARTY LICENSE NOTICE; do
    install -Dm644 $i "$pkgdir"/usr/share/licenses/$pkgname/$i
  done
}
