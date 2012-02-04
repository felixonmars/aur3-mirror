# Contributor: mrbug <devmrbug/at/gmail-dot-com>

pkgname="dvdtube"
pkgver=0.5
pkgrel=2
pkgdesc="Python script to archive a YouTube user's uploads to DVD"
arch=('i686' 'x86_64' 'ppc')
provides=('dvdtube')
license=('GPL3')
url="http://code.google.com/p/dvdtube/"
depends=('python' 'youtube-dl' 'python-gdata' 'python-feedparser' 'videotrans' 'kaa-svn')
source=(http://dvdtube.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('b8945a77d938e2db2054cf09dfa6362a')

build() {
  cd $startdir/src/$pkgname || return 1
  install -D -m 755 dvdtube.py ${pkgdir}/usr/bin/$pkgname || return 1
  install -D -m 644 COPYING ${pkgdir}/usr/share/doc/$pkgname/COPYING || return 1
  install -D -m 644 README ${pkgdir}/usr/share/doc/$pkgname/README || return 1
  install -D -m 644 CHANGELOG ${pkgdir}/usr/share/doc/$pkgname/CHANGELOG || return 1
  }
