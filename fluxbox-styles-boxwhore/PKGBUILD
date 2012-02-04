# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
pkgname=fluxbox-styles-boxwhore
pkgver=20060717
pkgrel=6
pkgdesc="A collection of FluxBox themes from boxwhore.org"
arch=('i686' 'x86_64')
url="http://www.boxwhore.org"
license="unknown"
depends=('fluxbox')
source=(http://themolok.netsons.org/uploads/boxwhore-styles-$pkgver.tar.gz styles-menu-boxwhore)
install=fluxbox-styles-boxwhore.install
md5sums=('975c834ff26b56966a577a7bf4bbd175' '5fd8824fa979c6e1b1ec5027c965ddc9')

build() {
  mkdir -p $startdir/pkg/usr/share/fluxbox/boxwhore
  mkdir -p $startdir/pkg/usr/share/fluxbox/menu.d/styles
  mv $startdir/src/styles-menu-boxwhore $startdir/pkg/usr/share/fluxbox/menu.d/styles
  cd $startdir/src/boxwhore-styles
  for file in * ;do
     case $file in
	*.tar.gz|*.tar.Z|*.tgz)
	tar --use-compress-program=gzip -xf "$file" ;;
	*.tar.bz2|*.tbz2)
	tar --use-compress-program=bzip2 -xf "$file" ;;
	*.zip)
	unzip -qqo "$file" ;;
     esac
  done
  for d in `find . -maxdepth 1 -type d`; do
     if [[ "x$d" != "x." ]]; then
	mv "$d" $startdir/pkg/usr/share/fluxbox/boxwhore
     fi
  done
  cd $startdir/pkg/usr/share/fluxbox/boxwhore
  mv .* * styles 2>/dev/null
  mv styles/{pixmaps,backgrounds} .
  cd styles
  mv .fluxbox/styles/* .
  mv .fluxbox/backgrounds/* ../backgrounds
  mv .fluxbox/pixmaps/*     ../pixmaps
  rm -fr .fluxbox
}
