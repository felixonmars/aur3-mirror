# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>

pkgname='quassel-core-static'
pkgdesc='Qt4 IRC client with a separated core - core only (static version)'
pkgver='0.12.2'
pkgrel='1'
arch=('i686' 'x86_64')
url='http://www.quassel-irc.org/'
license=('GPL')
depends=('lib32-glibc' 'glibc' 'openssl' 'lib32-openssl')
provides=('quassel-core')
conflicts=('quassel-core')
install="quassel.install"
source=("http://www.quassel-irc.org/pub/quasselcore-static-${pkgver}.bz2"
        'quassel.conf'
        'quassel.service')
sha512sums=('19df1cc79dc50c92caa2631ceabd16b2157fe38f04ba8d28ecab0f4c40297ab22c65ff313809f68903989c01c6ba6808cd2c11dbb8aa999d6db4f525ab51d6d0'
            'c76b560150e498d9c61c244e9ce7afe471055c8dee8a5f9ea6dad5814fe58f08b717b9dfa41425d07f86c95090b191df74539722a649e068ca60ca5543a82281'
            '79fc444081f4c68f2f0af88bf7e5de6d8efdc85d9b7f9431d1f4b9eb283f622fc5686c0623c64c10339f2bd54ae26c86cff43a3d4f646eef4db4048663a1068f')

package() {
  cd "$srcdir"
  install -Dm755 quasselcore-static-"${pkgver}" "$pkgdir"/usr/bin/quasselcore-static
  install -Dm644 quassel.service "$pkgdir"/usr/lib/systemd/system/quassel.service
  install -Dm644 quassel.conf "$pkgdir"/etc/conf.d/quassel  
}
