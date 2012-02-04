# Contributor: irgal <irgal@fird.net>

pkgname=bash-completion-migemo
_profile="$pkgname.sh"
pkgver=20080825
pkgrel=3
pkgdesc="Japanese completion with Romaji on bash"
arch=('i686' 'x86_64')
url="http://inz.sakura.ne.jp/bash-completion-with-migemo/"
license=('GPL3')
groups=('system')
depends=('migemo' 'ruby<1.9')
makedepends=('migemo')
source=("http://inz.sakura.ne.jp/bash-completion-with-migemo/archives/bash-completion-migemo-20080825.tar.gz"
        "$_profile")
md5sums=('d0703cbac55ad1b7c37f3ca00e41a6b3'
         '4d9d0f145f17b9c0fb77f50560c57eb2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  # make profile for bash-completion-migemo
  mkdir -p $pkgdir/etc/profile.d || return 1
  install -m755 $startdir/$_profile $pkgdir/etc/profile.d || return 1
}
