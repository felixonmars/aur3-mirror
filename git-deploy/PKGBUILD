# Maintainer: Adam Schubert <adam.schubert@sg1-game.net>

pkgname=git-deploy
pkgver=2.1.1
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
md5sums=('40af5871853c8decc2cce42956eb4c59')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  chmod +x ./setup-systemd.py
  ./setup-systemd.py install --root=$pkgdir/ --optimize=1
}