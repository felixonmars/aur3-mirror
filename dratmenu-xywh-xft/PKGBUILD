#Maintained by ivoarch <ivkuzev@gmail.com>
pkgname=dratmenu-xywh-xft
pkgver=20121223
pkgrel=1
pkgdesc="ratpoison window dmenu-q-xywh-xft"
arch=('any')
url="https://github.com/ivoarch/dratmenu.git"
license=('GPL')
depends=('dmenu-q-xywh-xft-git' 'python2') 
conflicts=('dratmenu')
makedepends=('git')

_gitroot="https://github.com/ivoarch/dratmenu.git"
_gitname="master"

build() {
        cd $srcdir

        if [ -d $srcdir/$pkgname ] ; then
                  msg "update git"
               cd $pkgname && git pull origin
               else
                  msg "clone git"
                    git clone $_gitroot
                    fi
}

package() {
          mkdir -p $pkgdir/usr/lib/python2.7/site-packages
          cp -r $srcdir/dratmenu $pkgdir/usr/lib/python2.7/site-packages
          mkdir -p $pkgdir/usr/bin
          echo "#!/bin/bash
          python2 /usr/lib/python2.7/site-packages/dratmenu/dratmenu.py" > $pkgdir/usr/bin/dratmenu
          chmod +x $pkgdir/usr/bin/dratmenu
}
