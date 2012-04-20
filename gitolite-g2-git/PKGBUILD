# Maintainer: Benjamin Severs <benjaminsevers at gmail dot com>
pkgname=gitolite-g2-git
pkgver=20120420
pkgrel=1
pkgdesc="A centralized git server, with very fine-grained access control and many powerful features. (g2 branch)"
arch=('any')
url="http://github.com/sitaramc/gitolite"
license=('GPL2')
depends=('perl' 'git')
conflicts=('gitolite-git' 'gitolite-g3-git')
backup=('etc/gitolite/example.conf'
        'etc/gitolite/example.gitolite.rc')
source=(configuration.patch)
md5sums=('aed0c3eb9e2809d43adedb4d511dadf2')
sha1sums=('a729e2064e83ee882520a903f0d856959275fc8d')

_gitroot="http://github.com/sitaramc/gitolite.git"
_gitname="gitolite"
_gitbranch="g2"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone -b $_gitbranch $_gitroot $_gitname 
  fi

  msg "GIT checkout done or server timeout"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  git describe --tags --long > conf/VERSION
  patch -p1 < ${srcdir}/configuration.patch
}

package() {
  cd "$srcdir/$_gitname-build"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/etc/gitolite"
  install -d "${pkgdir}/usr/share/gitolite/hooks"
  install -d "${pkgdir}/usr/share/doc/gitolite"
  install -t "${pkgdir}/usr/bin" src/*
  install -t "${pkgdir}/etc/gitolite" conf/*
  cp -r hooks/* "${pkgdir}/usr/share/gitolite/hooks"
  cp doc/* "${pkgdir}/usr/share/doc/gitolite"
}

# vim:set ts=2 sw=2 et:
