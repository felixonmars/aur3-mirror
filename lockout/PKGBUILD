# Contributor: Andrew Fuller <qartis@gmail.com>
pkgname=lockout
pkgver=0.2.3
pkgrel=2
pkgdesc='Temporarily scramble your root password to combat procrastination'
arch=('any')
url='http://thomer.com/lockout/'
license=('GPL')
depends=('perl')
backup=('etc/lockout/lock.sh' 'etc/lockout/unlock.sh')
install=('lockout.install')
source=('http://thomer.com/lockout/lockout-0.2.3.tgz' 'lockout.install' 'crontab.patch')
md5sums=('fa3e959d913393e82e0b86254454a242'
        '50accb9f4370ab8b733c4b553e836740'
        '2b8139a7eece3384ac86e8618b9dee30')

package() {
  cp -a $startdir/src/{etc,usr} $pkgdir
  cd $pkgdir
  patch -Np1 -i ../crontab.patch || return 1
}
