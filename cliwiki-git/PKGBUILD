# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
pkgname=cliwiki-git
pkgver=7cdf72d
pkgrel=1
pkgdesc="command line Wikipedia"
arch=('any')
url="https://github.com/AnirudhBhat/cliWiki.py"
license=('unknown')
depends=('python2')
makedepends=('git')
source=('git+https://github.com/AnirudhBhat/cliWiki.py.git')
md5sums=('SKIP')

_gitname="cliWiki.py"

pkgver () {
  cd $srcdir/$_gitname
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  cd $srcdir/$_gitname
  
  install -Dm644 "cliwiki.py" "$pkgdir/usr/share/cliwiki/cliwiki.py"
  install -Dm644 "README" "$pkgdir/usr/share/doc/$pkgname/README"

  echo "python2 /usr/share/cliwiki/cliwiki.py" > cliwiki
  install -Dm755 "cliwiki" "$pkgdir/usr/bin/cliwiki"
}

# vim:set ts=2 sw=2 et:
