# Contributor: hpestilence <hpestilence@gmail.com>
pkgname=glide64-wonder
pkgver=11
pkgrel=1
pkgdesc="Glide64 plugin for Mupen64"
arch=('i686')
url="http://www.emutalk.net/showthread.php?t=37658&page=9"
license=('GPL')
depends=('glib2' 'sdl')
source=('http://www.emutalk.net/attachment.php?attachmentid=36076&d=1177425342'
        Glide64.ini)
md5sums=('9625afa437623781a560353665f8ca2f'
         'ff50c27c4b0cc449146c76a9aa425181')

build() {
  cd $startdir/src/
  mv 'attachment.php?attachmentid=36076&d=1177425342' glide64-wonder+-linux-v11.tgz
  tar -xzf glide64-wonder+-linux-v11.tgz
  cd $startdir/src/$pkgname+
  sed -i -e "s:-mtune=athlon-xp:-march=i686:" Makefile
  make clean all || return 1
  mkdir -p $startdir/pkg/usr/share/mupen64/plugins
  cp Glide64.so $startdir/pkg/usr/share/mupen64/plugins/
  cp $startdir/src/Glide64.ini $startdir/pkg/usr/share/mupen64/plugins/
}
