# Maintainer: Erik R. Yverling <erik.r@yverling.se>
pkgname=ery-twinkle-broadcast-server-git
pkgdesc="Broadcast server used to star the currently playing song in Spotify with a single click."
_gitname=twinkle-broadcast-server
url="https://github.com/erikryverling/twinkle-broadcast-server"
pkgver=1.0.0
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
depends=('python2-autobahn')
makedepends=('git')
source=('git://github.com/erikryverling/twinkle-broadcast-server.git'
        'twinkle-broadcast-server.service')
md5sums=('SKIP' 
        '5c7900f0f6e371fc7aca8670186892f5')

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
    install -d $pkgdir/usr/share/twinkle-broadcast-server

    cp -R $srcdir/$_gitname/bin $pkgdir/usr/share/twinkle-broadcast-server/bin
    cp -R $srcdir/$_gitname/twinkle-broadcast-server $pkgdir/usr/share/twinkle-broadcast-server/twinkle-broadcast-server

    install -d $pkgdir/usr/bin
    ln -s /usr/share/twinkle-broadcast-server/bin/twinkle-broadcast-server.sh $pkgdir/usr/bin/twinkle-broadcast-server

    install -Dm 644 $srcdir/twinkle-broadcast-server.service $pkgdir/usr/lib/systemd/system/twinkle-broadcast-server.service

    install -D -m644 $srcdir/$_gitname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
