# Maintainer: Viktor Austli
# Based on jdk: https://aur.archlinux.org/packages/jdk/

pkgname=jdk-rpi
_major=8
_minor=33
_build=b05
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Oracle Java Development Kit - Raspberry PI"
arch=('armv6h')
url=http://www.oracle.com/technetwork/java/javase/downloads/jdk8-arm-downloads-2187472.html
license=('custom')
depends=('ca-certificates-java' 'java-environment-common' 'java-runtime-common' 'fakeroot')
provides=("java-runtime=$_major" "java-embedded=$_major" "java-runtime-headless=$_major" "java-web-start=$_major" "java-environment=$_major"
          "java-runtime-jre=$_major" "java-runtime-headless-jre=$_major" "java-web-start-jre=$_major" "java-environment-jdk=$_major")

# Variables
DLAGENTS=('http::/usr/bin/curl -LC - -b oraclelicense=a -O')

_arch=arm

_jname=${pkgname}${_major}
_jvmdir=/usr/lib/jvm/java-$_major-jdk

options=('!strip') # JDK debug-symbols
install=$pkgname.install

source=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/jdk-$pkgver-linux-$_arch-vfp-hflt.tar.gz")

md5sums=('f3ba05b6f41096a6c11d188c757d647b')

package() {
  cd jdk1.${_major}.0_${_minor}

  msg2 "Creating directory structure"
  install -d "$pkgdir"/etc/.java/.systemPrefs
  install -d "$pkgdir"/usr/lib/jvm/java-$_major-jdk/bin
  install -d "$pkgdir"/usr/share/licenses/java$_major-jdk

  msg2 "Removing redundancies"
  rm    db/bin/*.bat
  rm    jre/lib/fontconfig.*.bfc
  rm    jre/lib/fontconfig.*.properties.src
  rm    jre/*.txt
  rm    jre/COPYRIGHT
  rm    jre/LICENSE
  rm    jre/README
  rm    man/ja

  msg2 "Moving contents"

  msg2 "$pkgdir/$_jvmdir"
  mv * "$pkgdir"/$_jvmdir
	
  # Cd to the new playground
  cd "$pkgdir"/$_jvmdir

  msg2 "Fixing directory structure"
  # Replace duplicate binaries in bin/ with links to jre/bin/
  for i in $(ls jre/bin/); do
    ln -sf "$_jvmdir/jre/bin/$i" "bin/$i"
  done

  # Replace JKS keystore with 'ca-certificates-java'
  ln -sf /etc/ssl/certs/java/cacerts jre/lib/security/cacerts

  # Suffix man pages
  for i in $(find man/ -type f); do
    mv "${i}" "${i/.1}-${_jname}.1"
  done

  # Move man pages
  mv man/ja_JP.UTF-8/ man/ja
  mv man/ "$pkgdir"/usr/share

  # Move/link licenses
  mv COPYRIGHT LICENSE *.txt "$pkgdir"/usr/share/licenses/java$_major-jdk/
  ln -sf /usr/share/licenses/java$_major-jdk/ "$pkgdir"/usr/share/licenses/jdk
}
