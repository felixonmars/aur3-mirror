# Maintainer: TDY <tdy@gmx.com>

pkgname=packrat
pkgver=0.3
pkgrel=2
pkgdesc="A simple backup system with included modules for SSH, Amazon S3, and MySQL"
arch=('any')
url="http://www.zeroflux.org/projects"
license=('MIT')
depends=('bash' 'dar')
optdepends=('openssh: remote SSH storage via ssh.sh module'
            'aws:     remote Amazon S3 storage via aws.sh module'
            'curl:    remote Amazon S3 storage via s3.sh module'
            'perl:    remote Amazon S3 storage via s3.sh module'
            'mysql:   MySQL database backups via mysql.sh module')
install=packrat.install
source=(http://www.zeroflux.org/proj/$pkgname-$pkgver.tar.gz
        COPYING)
md5sums=('a740d9f0696a8000e998c41eb2572281'
         'f80cffeaf1a38d768b8c2ef87dc5c5d6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '19 s/(.*)/()/' $pkgname.conf
  install -dm755 "$pkgdir/usr/share/$pkgname/modules"
  install -cm644 modules/*.sh "$pkgdir/usr/share/$pkgname/modules"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm755 s3curl.pl "$pkgdir/usr/bin/s3curl.pl"
  install -Dm644 $pkgname.conf "$pkgdir/etc/$pkgname.conf"
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
