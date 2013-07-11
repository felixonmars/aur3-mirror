# Maintainer: Mike Krueger <info@memoryleakx.dudmail.com>
pkgname=adandcrapblock
pkgver=0.6
pkgrel=1
pkgdesc="This tool downloads the AdAway host-files and merge it into the file /etc/hosts"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/memoryleakx/AdAndCrapBlock"
depends=('qt4' 'gksu')
makedepends=('git')

_gitroot="git://github.com/memoryleakx/AdAndCrapBlock.git"
_gitname="AdAndCrapBlock"

build() {
  cd $srcdir

  msg "Getting sources"

  cd "${srcdir}"

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd ${srcdir}/$_gitname

  make || return 1
}

package() {
   install -d "$pkgdir"/usr/share/icons/AdAndCrapBlock/

   install -Dm755 "$srcdir/$_gitname/icons/aacblock_small.png" \
      "$pkgdir/usr/share/icons/AdAndCrapBlock/aacblock_small.png"

  install -Dm755 "$srcdir/$_gitname/icons/aacblock_middle.png" \
      "$pkgdir/usr/share/icons/AdAndCrapBlock/aacblock_middle.png"

  install -Dm755 "$srcdir/$_gitname/icons/aacblock_big.png" \
      "$pkgdir/usr/share/icons/AdAndCrapBlock/aacblock_big.png"

  install -Dm644 "$srcdir/$_gitname/AdAndCrapBlock.desktop" \
      "$pkgdir/usr/share/applications/AdAndCrapBlock.desktop"

  cd $srcdir
  cd $_gitname

  mkdir $pkgdir/usr/bin/
  cp AdAndCrapBlock $pkgdir/usr/bin/

}

