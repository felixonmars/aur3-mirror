# Contributor: GdelaRey <arch at delarey dot org>
# Maintainer:  GdelaRey <arch at delarey dot org>

pkgname='eeepc-fancontrol'
pkgver=15
pkgrel=1
pkgdesc='daemon which monitors Asus Eee cpu temperature and adjusts fan speed'
arch=('any')
url='http://code.google.com/p/eeepc-fancontrol/'
license=('GPL2')
depends=('eeepc-linux' 'perl')
makedepends=('subversion')
install='eeepc-fancontrol.install'
source=('archify.patch'
        'eeepc-fancontrol.rc')

_svntrunk='http://eeepc-fancontrol.googlecode.com/svn/trunk/'
_svnmod='eeepc-fancontrol'

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"

  patch -Np0 -i $srcdir/archify.patch || return 1

  return 0
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm644 "usr/share/doc/$pkgname/README" \
      "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm755 "usr/bin/$pkgname" "$pkgdir/usr/sbin/$pkgname"
  install -Dm755 "$srcdir/eeepc-fancontrol.rc" "$pkgdir/etc/rc.d/$pkgname"
}

md5sums=('dd7c18e42fdf6755efeccfcc790439eb'
         '22fc243398f87f613960ccb92d5a466b')
