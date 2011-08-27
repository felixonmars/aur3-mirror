
pkgname=jack-stdout-git
pkgver=20110331
pkgrel=1
pkgdesc="a small tool that writes JACK audio-sample data to buffered standard output. jack-stdin reads raw audio data from standard-input and writes it to a JACK audio port."
arch=('i686' 'x86_64')
url="http://rg42.org/oss/jackstdio/start"
license=('GPL')
makedepends=('git')
provides=('jack-stdout')
conflicts=('jack-stdout')
replaces=('jack-stdout')

_gitroot="git://rg42.org/jack-stdout"
_gitname="jack-stdout"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make all
}

package() {
  cd "$srcdir/$_gitname-build"
	
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/man/man1/
	
	install -m 755 jack-stdout ${pkgdir}/usr/bin/
	install -m 755 jack-stdin  ${pkgdir}/usr/bin/
	install -m 644 jack-stdout.1 ${pkgdir}/usr/share/man/man1/
	install -m 644 jack-stdin.1 ${pkgdir}/usr/share/man/man1/
	
} 
