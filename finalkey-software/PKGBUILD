# Maintainer: DusteD
pkgname=finalkey-software
pkgver=latest
pkgrel=1
pkgdesc="Software for The Final Key - Encrypted Hardware Password Manager"
arch=('x86_64')
url="http://finalkey.net/"
license=('GPL')
depends=('bash' 'minicom' 'xterm' 'coreutils' 'gzip' 'util-linux' 'gcc' 'sudo')
install=finalkey.install

optdepends=('java-runtime>=7: For finalkey gui')

source=("fksetup.sh::http://finalkey.net/fksetup.sh")
md5sums=('1fd2a8c827bb1fcfa05130074a7ad8b3')


package() {
   FK_ROOT_DIR=${pkgdir} bash fksetup.sh $USER  
}
