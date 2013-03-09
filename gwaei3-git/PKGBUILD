# Maintainer: Antonio Garcia-Dominguez <antonio dot garciadominguez at uca dot es>
# Contributor: Patrice Peterson <runiq at archlinux dot us>

pkgname=gwaei3-git
pkgver=20130309
pkgrel=1
pkgdesc="A Japanese-English dictionary program"
arch=('i686' 'x86_64')
url="http://gwaei.sourceforge.net"
license=('GPL3')
depends=('curl>=7.18.0' 'gconf>=2.22.0' 'hicolor-icon-theme'
         'libsexy>=0.1.11' 'libunique>=1.0.0')
makedepends=('git' 'gnome-doc-utils>=0.13.0' 'pkgconfig>=0.9.0' 'intltool' 'expect')
optdepends=('rsync: Provide incremental dictionary updates'
            'ttf-arphic-ukai'
            'ttf-kanjistrokeorders: Show stroke order diagrams')
provides=(gwaei)
conflicts=(gwaei gwaei3 gwaei-git)
install=gwaei.install

_gitroot="git://gwaei.git.sourceforge.net/gitroot/gwaei/gwaei"
_gitname="gwaei"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  mkdir "$srcdir/$_gitname-build"
  # do not copy over the .git folder
  cd "$srcdir/$_gitname" && \
      ls -A | grep -v .git | xargs -d '\n' cp -r -t ../$_gitname-build

  cd "$srcdir/$_gitname-build"
  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac

  expect -c 'spawn ./autogen.sh; expect "Press Return"; send "\n"; interact'
  ./configure --prefix=/usr --disable-schemas-install \
    --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
} 

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install  
}
