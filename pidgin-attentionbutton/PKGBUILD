pkgname=pidgin-attentionbutton
pkgver=0.3
pkgrel=3
pkgdesc="Attention Button is a plugin for Pidgin that adds a button in the conversation window to easly Nudge/Buzz/Zap your friends."
arch=('i686' 'x86_64')
url="http://code.google.com/p/pidgin-attentionbutton/"
license=('GPL')
provides=('pidgin-msn-nudge')
source=(http://pidgin-attentionbutton.googlecode.com/files/attentionbutton-$pkgver.tar.gz Makefile fix.patch)
md5sums=('0134ecb5d56231744110d2acad818ddb'
         'd994050d0143c43c9e6ec103c527ec9d'
         '27122b1048848818996c53e6e8fad1ad')


build() {
  rm $srcdir/attentionbutton.so
  patch -p0 -i $srcdir/fix.patch || return 1
  make || return 1
  install -Dm755 attentionbutton.so ${pkgdir}/usr/lib/purple-2/attentionbutton.so || return 1

}

