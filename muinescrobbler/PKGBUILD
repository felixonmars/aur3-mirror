pkgname=muinescrobbler
pkgver=0.1.8
pkgrel=1
pkgdesc="Muine Audioscrobbler plugin"
url="http://home.gna.org/muinescrobbler/"
depends=( muine )
makedepends=( mono )
source=( http://download.gna.org/muinescrobbler/muinescrobbler-0.1.8.tar.gz )
md5sums=( c8470e586c5face7f9be09decbe20398 )

build() {
  # Needed for non root builds
  export MONO_SHARED_DIR=$startdir/src
  cd $startdir/src/$pkgname
  make || return 1
  MUINEPLUGINDIR=$startdir/pkg/opt/gnome/lib/muine/plugins
  mkdir -p $MUINEPLUGINDIR
  cp $startdir/src/$pkgname/AudioscrobblerPlugin.dll $MUINEPLUGINDIR || return 1
  unset MONO_SHARED_DIR
}
