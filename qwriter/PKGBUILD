# Contributor: adriano <adriano.src@gmail.com>
pkgname=qwriter
pkgver=0.1.9
pkgrel=1
pkgdesc="A Qt advanced text editor"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/QWriter?content=106377&PHPSESSID=b0c5f19ef8aa96312c98b42b040bbc1a"
license=('GPL')
depends=('qt' 'qscintilla')
source=(http://qwriter.googlecode.com/files/qwriter-0.1.9-src.tar.gz)

build() {
  cd "$srcdir/qwriter-0.1.9-src"
  qmake
  make || return 1
  install -Dm 755 $srcdir/qwriter-0.1.9-src/bin/qwriter $pkgdir/usr/bin/qwriter  
}


md5sums=('ca3d7e411c3b4f3e83a1d4a6feae0c33')
