# Maintainer: mmm
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname='gmailfs-git'
_pkgbase=gmailfs
pkgver=0.8.9
pkgrel=2
pkgdesc="GMail Filesystem over FUSE"
arch=('any')
license=('GPL')
depends=('python2' 'python2-fuse' 'imaplib') #it is python2-imaplib
makedepends=('git')
provides=('gmailfs')
url="http://sr71.net/projects/$_pkgbase"
source=('git+git://git.sr71.net/gmailfs.git' $pkgname-python27.patch)
#source=(gmailfs.conf) local config
backup=(etc/$_pkgbase/$_pkgbase.conf)
md5sums=('SKIP' '68ce269f79d77bcc8bff757610a4868e')

build() {
  cd $srcdir/gmailfs
  patch -i ${srcdir}/$pkgname-python27.patch
}

package() {
  cd $srcdir/gmailfs
  install -Dm755 $_pkgbase.py "$pkgdir/usr/bin/$_pkgbase"
  install -Dm644 conf/$_pkgbase.conf "$pkgdir/etc/$_pkgbase/$_pkgbase.conf"
}
