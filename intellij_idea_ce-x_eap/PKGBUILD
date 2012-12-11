# Maintainer: Denis Dzenskevich <denis.dzenskevich at gmail.com>
# Contributor: scheffold <fscheffold (at) gmail.com>
# Contributor: Urs Wolfer <uwolfer @ fwo.ch>

pkgname=intellij_idea_ce-x_eap
pkgver=117.1034
pkgrel=1
install=intellijidea.install
pkgdesc="Early access version of the upcoming Intellij Idea 11 Java IDE (community version) with custom modifications"	
arch=('i686' 'x86_64')
url="http://confluence.jetbrains.net/display/IDEADEV/IDEA+11+EAP"
license=('apache')
depends=('java-environment')
makedepends=('clang')
_commit=8de8f3b9b08c4e27a9a92f5fb79308fbfb2e83d0

source=(
	"fsnotifier.h::http://git.jetbrains.org/?p=idea/community.git;a=blob_plain;f=native/fsNotifier/linux/fsnotifier.h;hb=$_commit" \
	"inotify.c::http://git.jetbrains.org/?p=idea/community.git;a=blob_plain;f=native/fsNotifier/linux/inotify.c;hb=$_commit" \
	"main.c::http://git.jetbrains.org/?p=idea/community.git;a=blob_plain;f=native/fsNotifier/linux/main.c;hb=$_commit" \
	"util.c::http://git.jetbrains.org/?p=idea/community.git;a=blob_plain;f=native/fsNotifier/linux/util.c;hb=$_commit" \
	"http://git.jetbrains.org/?p=idea/community.git;a=blob_plain;f=native/fsNotifier/linux/make.sh" \
	intellijidea.sh intellijidea.desktop idea.vmoptions intellijidea.png intellijidea.install \
	http://download.jetbrains.com/idea/ideaIC-${pkgver}.tar.gz
)

if [ "$CARCH" = "i686" ]; then
 	_fsnotifier="fsnotifier"
	_clang_flags="-m32"
  elif [ "$CARCH" = "x86_64" ]; then
 	_fsnotifier="fsnotifier64"  
	_clang_flags="-m64"
fi         

build() {
  cd "$srcdir"

  clang $_clang_flags -O2 -Wall -std=c99 -D_BSD_SOURCE -D_XOPEN_SOURCE=500 -o $_fsnotifier main.c inotify.c util.c

  install -d -m755 "$pkgdir/"usr/{bin,share}
  cp -a "idea-IC-$pkgver" "$pkgdir/usr/share/$pkgname"

  sed -i 's|.IdeaIC10|\.IntelliJIdeaXce|' "$pkgdir/usr/share/$pkgname/bin/idea.properties"
  
  cp "$srcdir"/idea.vmoptions "$pkgdir"/usr/share/$pkgname/bin
  cp "$srcdir"/$_fsnotifier "$pkgdir"/usr/share/$pkgname/bin/fsnotifier

  chmod +x $pkgdir/usr/share/$pkgname/bin/idea.sh
  chmod +x "$pkgdir"/usr/share/$pkgname/bin/fsnotifier

  if [ "$CARCH" = "i686" ]; then
    _rmpostfix="64"
  elif [ "$CARCH" = "x86_64" ]; then
    _rmpostfix=""
  fi
  rm $pkgdir/usr/share/intellij_idea_ce-x_eap/bin/\
{fsnotifier$_rmpostfix,libbreakgen$_rmpostfix.so}

  install -D -m755 "$srcdir"/intellijidea.sh "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "$srcdir"/intellijidea.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -D -m644 "$srcdir"/intellijidea.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}

md5sums=('703feffa16c7c8485935e5de795793a4'
         'b29ad6a43cd22400c7fa2e9304b112ee'
         'b22ff5c4bb99fd1b14d7da5f0f60e79b'
         'b5e338a0a6ae28763c7c246dd36c1b6a'
         '0c4e4f9b94713040cc7cb9a4df856504'
         '829f2cfa7ea9c7260f6a202c8834851d'
         '767f1466745aef96201322855029f589'
         'c51777b27eed5cca4d0406b3cf060406'
         'f22815c48dca91edc530953d5aa806dd'
         '48130e94e6b816978f90b6f05b788ffc'
         'e279c2c0c50da6e53c599840f19d48d1')
