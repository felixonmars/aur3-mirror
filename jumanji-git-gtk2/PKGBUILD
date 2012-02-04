#Maintainer: k8n <egor.k8n@gmail.com>

pkgname=jumanji-git-gtk2
pkgver=20120107
pkgrel=1
pkgdesc="jumanji is a highly customizable and functional web browser based on the libwebkit web content engine and the gtk+ toolkit"
arch=('i686' 'x86_64')
url="http://pwmt.org/projects/jumanji"
license=('custom')
depends=('girara-gtk2-git' 'libwebkit>=1.6.1' 'libsoup>=2.36.1')
makedepends=('git')

conflicts=('jumanji' 'jumanji-git' 'jumanji-git-gtk2')
provides=('jumanji' 'jumanji-git' 'jumanji-git-gtk2')

_gitroot='git://pwmt.org/jumanji.git'
_gitname='jumanji'
_branch='develop'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname && git checkout --track -b $_branch origin/$_branch
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -d ${srcdir}/$_gitname-build ]; then
    rm -rf ${srcdir}/$_gitname-build
  fi

  git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build || return 1
  cd ${srcdir}/$_gitname-build/ || return 1

  sed -i'' \
      -e 's/gtk+-3.0/gtk+-2.0/g' \
      -e 's/girara-gtk3/girara-gtk2/g' \
      -e 's/webkitgtk-3.0/webkit-1.0/g' \
      -e 's/javascriptcoregtk-3.0/javascriptcoregtk-1.0/g' \
      config.mk
  
  make DATABASE=plain DESTDIR="$pkgdir/" install || return 1
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
