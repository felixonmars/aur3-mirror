# Maintainer: SaultDon <sault.don gmail>
# Contributor: josepghbr <rafael.f.f1@gmail.com>

pkgname=java-jai
pkgver=1.1
pkgrel=3
_pkgver=${pkgver/./_}_${pkgrel}
pkgdesc="Container for JavaTM Advanced Imaging projects."
arch=(i686 x86_64)
  [ "${CARCH}" = 'i686' ]   && _arch='i586'
  [ "${CARCH}" = 'x86_64' ] && _arch='amd64'
url="https://java.net/projects/jai/"
license=('custom')
depends=('java-environment' 'glibc')
install=java-jai.install
source=(http://download.java.net/media/jai/builds/release/${_pkgver}/jai-${_pkgver}-lib-linux-${_arch}.tar.gz
	jai.profile.csh
	jai.profile)
[ "${CARCH}" = 'i686' ] && md5sums=('a2cbc155ef3899bcde9c74a8035764b3')
[ "${CARCH}" = 'x86_64' ] && md5sums=('4a906db35612f668aeef2c0606d7075b')
md5sums=("${md5sums[@]}"
	 'aef2e1f05adf2861f5bed8e249f074e1'
	 '040c62cb352717bcb1634f76a94a49db')

package() {
  cd "$srcdir/jai-${_pkgver}"

  msg "Installing user profiles..."
  install -D ${srcdir}/jai.profile \
    ${pkgdir}/etc/profile.d/jai.sh
  install -D ${srcdir}/jai.profile.csh \
    ${pkgdir}/etc/profile.d/jai.csh
    
  msg "Installing jre libs..."
  install -d ${pkgdir}/usr/lib/jvm/java-7-openjdk/lib
  install -Dm644 lib/* \
    ${pkgdir}/usr/lib/jvm/java-7-openjdk/lib
  
  msg "Installing licenses..."
  install -d $pkgdir/usr/share/licenses/$pkgname   
  install -Dm644 *.txt $pkgdir/usr/share/licenses/$pkgname
}
