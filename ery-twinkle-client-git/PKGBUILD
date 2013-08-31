# Maintainer: Erik R. Yverling <erik.r@yverling.se>
pkgname=ery-twinkle-client-git
pkgdesc="Client used to star the currently playing song in Spotify with a single click"
_gitname=twinkle-client
url="https://github.com/erikryverling/twinkle-client"
pkgver=1.0.0
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
depends=('python2-autobahn')
makedepends=('git')
source=('git://github.com/erikryverling/twinkle-client.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git tag
}

build() {
    # No need for Windows executables
    rm $srcdir/$_gitname/bin/*.bat

    # Arch Linux is using python2 instead of python
    sed -i s/python/python2/ $srcdir/$_gitname/bin/*sh
}

package() {
    install -d $pkgdir/usr/share/twinkle-client

    cp -R $srcdir/$_gitname/bin $pkgdir/usr/share/twinkle-client/bin
    cp -R $srcdir/$_gitname/twinkle-client $pkgdir/usr/share/twinkle-client/twinkle-client

    install -d $pkgdir/usr/bin
    ln -s /usr/share/twinkle-client/bin/twinkle.sh $pkgdir/usr/bin/twinkle

    install -D -m644 $srcdir/$_gitname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
