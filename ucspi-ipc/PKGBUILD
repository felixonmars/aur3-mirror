# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=ucspi-ipc
pkgver=0.67
pkgrel=4
pkgdesc="Command-line tools for building local-domain client-server applications."
url="http://www.superscript.com/ucspi-ipc/intro.html"
license="Freely Redistributable"
depends=('glibc')
makedepends=()
conflicts=()
replaces=()
backup=()
arch=('i686')
install=
source=(http://www.superscript.com/ucspi-ipc/$pkgname-$pkgver.tar.gz man.tar.gz \
	ipccat  ipcconnect  ipcdo  ipcrun )
md5sums=('68439fc45f7a52a481667aebe14b3a33' '2c78c9faaaeb606f9e312cb8ff3368fa'\
         'e48efa05cd2341dc867efe9ea218fefb' '742c289c4354120eff27f4e861aac435'\
         'a19103483d52959735271c5a21a20694' 'f407530125eda9e465d08b227d8649d2')


build() {
  cd $startdir/src/host/superscript.com/net/ucspi-ipc-0.67/
  echo "${CC:-gcc} ${CFLAGS:--fomit-frame-pointer -Wimplicit -Wunused -Wcomment -Wchar-subscripts -Wuninitialized -Wshadow -Wcast-qual -Wcast-align -Wwrite-strings -O1 -malign-double} -c" > src/conf-cc
  echo "${LD:-gcc -s}" > src/conf-ld
  
  package/compile base || exit 1
  
  install -d $startdir/pkg/usr/bin/
  for i in `cat package/commands-base`; do
    install -m0755 command/$i $startdir/pkg/usr/bin/
  done
  

  cd $startdir/src/man/
  install -d $startdir/pkg/usr/man/man8
  for i in *.8
  do
    install -m0644 $i $startdir/pkg/usr/man/man8
  done
  
  cd ..
  install -m 0755 ipccat ipcconnect ipcdo ipcrun $startdir/pkg/usr/bin/

}
