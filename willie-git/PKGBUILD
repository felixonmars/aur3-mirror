# Maintainer: William Osler <wosler@acm.org> 
pkgname=willie-git
pkgver=20140117
pkgrel=1
pkgdesc="A modular IRC bot written in Python."
arch=('any')
url="http://willie.dftba.net/"
license=('custom:Eiffel Forum License, version 2')
depends=('python2' 'python2-pyopenssl')
makedpends=(git)
optdepends=('mysql-python: bucket module'
'python2-feedparser: nws and rss modules'
'python2-pytz: remind module'
'python2-lxml: xkcd module'
'python2-pyenchant: spellchek module'
'tweepy-git: twitter module'
'python2-praw-git: reddit module'
)
conflicts=(willie)
install='willie.install'
source=("$pkgname"::'git://github.com/embolalia/willie.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  #Willie uses EFL2 which isn't a standard Arch license
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  cp COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Config and systemd files
  mkdir -p "$pkgdir/etc/"
  cp contrib/willie.cfg "$pkgdir/etc/"
  mkdir -p "$pkgdir/usr/lib/tmpfiles.d/"
  cp contrib/willie.conf "$pkgdir/usr/lib/tmpfiles.d/"
  mkdir -p "$pkgdir/usr/lib/systemd/system/"
  cp contrib/willie.service "$pkgdir/usr/lib/systemd/system/"
  mkdir -p "$pkgdir/var/log/willie/"
}
