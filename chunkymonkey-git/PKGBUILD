# Maintainer: tang0th <tang0th@gmx.com>
pkgname=chunkymonkey-git
pkgver=20111024
pkgrel=1
pkgdesc="A Minecraft Server written in Google Go"
arch=(any)
url="http://github.com/huin/chunkymonkey"
license=('MIT')
depends=('go')
makedepends=('git' 'godag-hg')

_gitroot="git://github.com/huin/chunkymonkey.git"
_gitname="chunkymonkey"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  if [[ "$CARCH" == "i686" ]]; then
      export GOARCH=386
  else
      export GOARCH=amd64
  fi

  cd "$srcdir/chunkymonkey"

  make
}

package() {
  msg "Let's pack up this crate :)"
  cd "$srcdir/$_gitname"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/chunkymonkey/
  mkdir -p $pkgdir/usr/share/chunkymonkey/bin/
  install -m 554 bin/{chunkymonkey,datatests,inspectlevel,intercept,noise,replay,style,readme.md} $pkgdir/usr/share/chunkymonkey/bin/
  install -m 664 {blocks.json,CREDITS.md,DESIGN.md,furnace.json,groups.json,items.json,LICENSE,README.md,recipes.json,users.json} $pkgdir/usr/share/chunkymonkey/
  echo "#!/bin/bash" >> $pkgdir/usr/bin/chunkymonkey
  echo "cd /usr/share/chunkymonkey/" >> $pkgdir/usr/bin/chunkymonkey
  echo "exec bin/chunkymonkey $1 $2 $3 $4 $5 $6 $7 $8 $9" >> $pkgdir/usr/bin/chunkymonkey
  chmod +x $pkgdir/usr/bin/chunkymonkey
}
