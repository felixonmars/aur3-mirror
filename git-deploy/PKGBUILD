# Maintainer: Adam Schubert <adam.schubert@sg1-game.net>

pkgname=git-deploy
pkgver=2.1.8
pkgrel=1
pkgdesc="Git-deploy is tool written in python to allow fast and easy deployments on remote servers wia S/FTP, SSH/SCP"
arch=('any')
license=('GPL')
url='https://github.com/Salamek/git-deploy'
depends=('python2'
 'python2-paramiko'
 'python2-twisted'
 'git')
backup=('etc/git-deploy/git-deploy.cfg')
makedepends=()
source=("https://github.com/Salamek/git-deploy/archive/$pkgver.tar.gz")
noextract=()
md5sums=('d7eb69a4a391698d8321596f6937a2f8')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  echo "systemd" > .target
  ./setup.py install --root=$pkgdir/ --optimize=1
  rm .target
}
