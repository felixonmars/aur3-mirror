# Maintainer: David Campbell <davekong@archlinux.us>
pkgname=dkbash-git
pkgver=20101104
pkgrel=1
pkgdesc='A collection of bash scripts.'
arch=('any')
url='http://github.com/davekong/bash'
license=('GPL')
depends=('tree' 'bash')
makedepends=('git')

_gitroot='git://github.com/davekong/bash.git'
_gitname='bash'

build() {
  cd "$srcdir"
  msg 'Connecting to GIT server...'

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg 'The local files are updated.'
  else
    git clone $_gitroot $_gitname
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # BUILD HERE
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm755 mktree.sh "$pkgdir/usr/bin/mktree"
  install -Dm755 word_bubbles.sh "$pkgdir/usr/bin/word_bubbles"
}
