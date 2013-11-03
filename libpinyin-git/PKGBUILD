# Maintainer: Yangtse <yangtsesu@gmail.com>
#Contributor: WU Jun <quark at lihdd dot net>

pkgname=libpinyin-git
_gitname=libpinyin
pkgver=1256.262efe1
pkgrel=1
pkgdesc="Library to deal with pinyin."
arch=('i686' 'x86_64')
url="https://github.com/libpinyin/libpinyin"
license=('GPL')
depends=('db' 'glib2')
provides=('libpinyin')
conflicts=('libpinyin')
source=('git+https://github.com/libpinyin/libpinyin.git'
	'http://downloads.sourceforge.net/libpinyin/models/model7.text.tar.gz')
noextract=("model7.text.tar.gz")
md5sums=('SKIP'
         '5fdef1993411721a00ca2b0b00e3a4cf')
options=(!libtool)

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $_gitname

  cp "${srcdir}/model7.text.tar.gz" "${srcdir}/${_gitname}/data/"
  sed -i '/wget.*model.\.text\.tar\.gz/ d' ${srcdir}/${_gitname}/data/Makefile.am
  
  aclocal && libtoolize --force && autoheader && automake -a && autoconf
  ./configure --prefix=/usr && make
}

package() {
  cd $_gitname
  make DESTDIR=${pkgdir} install
}
