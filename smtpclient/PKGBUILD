# Contributor: Gergely Tamas <dice@mfa.kfki.hu>
pkgname=smtpclient
pkgver=1.0.0
pkgrel=1
pkgdesc="simple SMTP client"
url="ftp://ftp.ossp.org/pkg/tool/smtpclient/"
license="GPL"
depends=('glibc')
source=(ftp://ftp.ossp.org/pkg/tool/smtpclient/$pkgname-$pkgver.tar.gz)
md5sums=('8b5d9260572107bb901edf6aacbf3747')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
