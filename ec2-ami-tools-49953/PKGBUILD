# Contributor: Mike Miller (mike at ip data tel dot com)

pkglabel=ec2-ami-tools
pkgname=ec2-ami-tools-49953
pkgver=1.3
_pkbuild=49953
pkgrel=3
pkgdesc="(Updated 20100504) The Amazon EC2 AMI Tools are command-line utilities to help bundle an Amazon Machine Image (AMI), create an AMI from an existing machine or installed volume, and upload a bundled AMI to Amazon S3."
arch=('any')
url="http://developer.amazonwebservices.com/"
source=(http://ec2-downloads.s3.amazonaws.com/$pkglabel-$pkgver-$_pkbuild.zip)
depends=(ruby rsync)
license=('custom')

md5sums=('06c502df259b1edf7cc4429fa4b2b1ce')

build() {
  cd $srcdir/$pkgname-$pkgver-$_pkbuild
  mkdir -p $pkgdir/usr
  cp -r lib $pkgdir/usr
  cp -r etc $pkgdir
  find $pkgdir -type f | xargs chmod 644
  sed -i 's#^home=.*$#home=/usr#' bin/*
  cp -r bin $pkgdir/usr
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  install -m 644 license.txt $pkgdir/usr/share/licenses/$pkgname/
}

