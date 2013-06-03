# Contributor: Antonio Bonifati <antonio-bonifati@gmail/com> (substitute -/ with .)
pkgname=sqlbuddy
pkgver=1.3.3
pkgrel=4
pkgdesc='Fast web-based tool to administrate MySQL'
arch=('i686' 'x86_64')
url='http://sqlbuddy.com/'
license=('MIT')
depends=('mysql' 'php')
install=sqlbuddy.install
source=($pkgname-$pkgver.zip::https://github.com/calvinlough/sqlbuddy/raw/gh-pages/sqlbuddy.zip apache.example.conf)
md5sums=('b90bb46584a23a587ffb424eda9f79c5' '1c412ecfac97425920c0390885d97e3a')

package() {
  local instdir=$pkgdir/usr/share/webapps
  cd $srcdir
  install -d -m0755 $instdir $pkgdir/{etc/webapps,usr/share/licenses}/$pkgname && \
  mv $pkgname $instdir/$pkgname && \
  chmod -R -X+X $instdir/$pkgname/ && \
  install -m0644 apache.example.conf $pkgdir/etc/webapps/$pkgname/ && \
  install -m0644 $instdir/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/ && \
  rm $instdir/$pkgname/LICENSE
}
