# Maintainer: Casey Link < unnamedrambler gmail DOT com>
pkgname=lazy-newb-pack
pkgver=20120118
pkgrel=1
pkgdesc="Lazy Newb Pack for Linux"
arch=('i686' 'x86_64')
url="http://www.bay12forums.com/smf/index.php?topic=59026.1140"
license=('BSD 3-clause')
depends=('gcc-libs' 'qt')
makedepends=('git' 'unzip')
source=(http://binaryelysium.com/df/LNP_data-9.3.zip
        lazy-newb-pack
        lazy-newb-pack.desktop
        lnp.png)
noextract=(${source[@]##*/})
md5sums=(f0d46d39e0efac2ed774766780307687
         f57d6fb34ea0f2b7884ac6f983396564
         773f7ac1f46eb83e3b0ac2560c8f1457
         9115aaf044e125472e1679ff6201fb93)
_gitroot="git@github.com:Ramblurr/lazy-newb-pack-qt.git"
_gitname="lazy-newb-pack-qt"


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  # BUILD

  qmake "Lazy Newb Pack.pro"
  make || return 1

  cd "$srcdir"
}

package() {
  cd "$srcdir"
  if [ -d LNP ] ; then
    rm -rf LNP/
  fi
  unzip "LNP_data-*.zip"

  cd "$srcdir/$_gitname"

  install -dm755 $pkgdir/opt/$pkgname
  cp -r $srcdir/LNP $pkgdir/opt/$pkgname/
  install -Dm755 "${srcdir}/${_gitname}/Lazy Newb Pack" $pkgdir/opt/$pkgname/lazy-newb-pack
  install -d -m775 -o root -g games $pkgdir/opt/$pkgname/LNP
  chmod -R 775 $pkgdir/opt/$pkgname/LNP
  chown -R root:games $pkgdir/opt/$pkgname/LNP

  install -Dm755 $srcdir/lazy-newb-pack $pkgdir/usr/bin/lazy-newb-pack
  install -Dm644 $srcdir/lazy-newb-pack.desktop $pkgdir/usr/share/applications/lazy-newb-pack.desktop
  install -Dm644 $srcdir/lnp.png $pkgdir/usr/share/pixmaps/lnp.png
}

# vim:set ts=2 sw=2 et:
