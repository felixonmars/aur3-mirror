# Maintainer Paul Burton <paulburton89@gmail.com>
# Contributor Jonny Gerold <jonny@fsk141.com>

pkgname=bin32-jdk-java5
pkgver=5.0u22
pkgrel=1
pkgdesc="32-bit Sun java development kit for Arch x86_64"
arch=('x86_64')
license=('custom')
url="https://dev.java.net"
depends=('lib32-glibc' 'lib32-libgl' 'lib32-libx11' 'lib32-libxtst' 'mozilla-common' 'lib32-libxi')
makedepends=('diffutils' 'fakeroot' 'pkgconfig')
install=bin32-jdk.install
bin32name=jdk-${pkgver}-dlj-linux-i586
source=(http://download.java.net/dlj/binaries/${bin32name}.bin \
	'construct.sh' 'construct.patch')

md5sums=('f3afc43863c8f529a81fe42bef912d8c'
         '94065b612df0046d9ae758943f9f6a75'
         '88ad70c4ee77f58d761225a59ab3b7d9')

build() {
  cd ${startdir}/src

  patch -p0 <construct.patch || return 1

  chmod +x ${bin32name}.bin || return 1
  mkdir -p unbundle-jdk
  cd unbundle-jdk
  LD_PRELOAD="" sh ../${bin32name}.bin  --accept-license || return 1

  cd ${startdir}/src

  chmod +x construct.sh
  LD_PRELOAD="" sh construct.sh unbundle-jdk linux-jdk linux-jre || return 1
  mkdir -p ${startdir}/pkg/opt/${pkgname}
  cp -r linux-jdk/* ${startdir}/pkg/opt/${pkgname} || return 
}

