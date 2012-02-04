# Contributor: Calum Macdonald <calum.asu AT gmail DOT com>
pkgname=playdar-core
pkgver=current
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Playdar is a music content resolver service - run it on every computer you use, and you'll be able to listen to all the songs you would otherwise be able to find manually by searching though all your computers, hard disks, online services, and more"
url="http://www.playdar.org/"
license=('GPL3')
depends=('erlang' 'git' 'taglib' 'gcc')
makedepends=('make')
source=(playdar.patch)
md5sums=(643835611059543e4272c00b52b3279c)

_gitroot="git://github.com/RJ/playdar-core.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $pkgdir/opt/$pkgname-$pkgver ]]; then
    chmod 755 $pkgdir/opt/$pkgname-$pkgver
    cd $pkgdir/opt/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $pkgdir/opt/$pkgname-$pkgver || return 1
    chmod 755 $pkgdir/opt/$pkgname-$pkgver
    cd $pkgdir/opt/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  git reset --hard HEAD
  git apply ../../../playdar.patch || return 1

	make || return 1
	make scanner || return 1
  
  # Install conf file
  install -D -m644 $pkgdir/opt/$pkgname-$pkgver/etc/playdar.conf.example $pkgdir/etc/playdar.conf.example
 
}
