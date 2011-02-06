# Contributor: Nathan Owe. <ndowens.aur at gmail dot com>
pkgname=eloy
pkgver=0.3.3
pkgrel=2
pkgdesc="A command line backup system that uses rsync to make backups of file and directories"
arch=('i686' 'x86_64')
url="http://code.google.com/p/${pkgname}/"
license=('BSD')
depends=('bash')
source=(http://${pkgname}.googlecode.com/svn/tags/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('0f33ad4803f88237f3bdffa804abbe31') 

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -d $pkgdir/usr/{bin,share/{$pkgname,licenses/$pkgname}}
  install ${pkgname}-{backup.scpt,compress.scpt} ${pkgname}{_postgresql.sh,_demo_plugin.sh,.cf} ${pkgdir}/usr/share/${pkgname}/
  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
