# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=popper
pkgver=0.31.3
pkgrel=1
pkgdesc="Reads the new emails from POP3 and IMAP email servers and notifies about the number, subject, sender and time of new emails in the indicator applet and via a notification bubble"
arch=('any')
url="https://launchpad.net/popper"
license=('GPL')
depends=('python2-gnomekeyring' 'python2-notify' 'libindicate-gtk2')
source=(https://launchpad.net/~ralf.hersel/+archive/rhersel-ppa/+files/${pkgname}_$pkgver.orig.tar.gz)
md5sums=('79aba99b54bb5b6809612ed75c99cd43')

build() {
  cd "$srcdir/${pkgname}_$pkgver"
  sed -i 's@#!.*python@#!/usr/bin/python2@' popper/popper{,_config,_list}.py
  sed -i 's@python @python2 @' popper/popper{,_config}.sh
}

package() {
  cd "$srcdir/${pkgname}_$pkgver"

  mkdir -p "$pkgdir/usr/share"
  cp -r popper locale applications "$pkgdir/usr/share"
}
