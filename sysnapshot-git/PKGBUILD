# Maintainer: Sandy Marko Knauer <knamarksan@gmail.com>

pkgname=sysnapshot-git
pkgver=0.0.1
_pkgver=0.0.1
pkgrel=6
pkgdesc='backup tool written in ruby'
arch=('any')
license=('GPL2')
url='http://knasan.de/'
makedepends=('git')
provides=('sysnapshot')
source=('git://github.com/knasan/sysnapshot.git')
depends=('ruby' 'rsync')
#optdepends=('')
sha256sums=('SKIP')
_gitname='sysnapshot'

package() {
  cd "$srcdir/$_gitname"

  git checkout  $(echo sysnapshot-v$_pkgver-r$pkgrel) 2>/dev/null

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/sysnapshot"
  mkdir -p "$pkgdir/etc/sysnapshot/"

  install -m755 bin/sysnapshot "$pkgdir/usr/bin/"
  install -m644 lib/sysnapshot/*.rb "$pkgdir/usr/lib/sysnapshot"
  install -m644 etc/sysnapshot/sysnapshot.* "$pkgdir/etc/sysnapshot/"
}

