# Maintainer:    David <david.e [at] r3v0luti0n [dot] com>

pkgname=cloudzec
_pkgname='rtorrent'
pkgver=0.17
pkgrel=1
pkgdesc='CloudZec sync (short „cloudzec“) is a free synchronisation solution with end-to-end encryption, based on stable technologies like GnuPG and SFTP'
url='http://cloudzec.org'
arch=('any')
license=('GPL3')
depends=('python' 'python-gnupg-isis')
makedepends=('git')
source=('git://github.com/revogit/cloudzec.git')
sha1sums=('SKIP')

pkgver() {
    cd cloudzec/
    echo "0.$(git log --format='%ci' | wc -l)"
}

build() {
  cd "${pkgname}"
  git checkout master
}

package() {
  cd "${pkgname}"
  git checkout master
  install -Dm644 libcloudzec.py    "${pkgdir}/usr/lib/python3.4/libcloudzec.py"
  install -Dm755 cloudzec          "${pkgdir}/usr/bin/cloudzec"
}
