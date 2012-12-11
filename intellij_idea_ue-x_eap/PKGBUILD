# Maintainer: Denis Dzenskevich <denis.dzenskevich at gmail.com>
# Contributor: scheffold <fscheffold (at) gmail.com>
# Contributor: Urs Wolfer <uwolfer @ fwo.ch>

pkgname=intellij_idea_ue-x_eap
pkgver=117.1034
pkgrel=1
install=intellijidea.install
pkgdesc="Early access version of the upcoming Intellij Idea 11 Java IDE (ultimate version) with custom modifications"	
arch=('i686' 'x86_64')
url="http://confluence.jetbrains.net/display/IDEADEV/IDEA+11+EAP"
backup=("usr/share/${pkgname}/bin/idea.vmoptions" "usr/share/${pkgname}/bin/idea64.vmoptions"
        "usr/share/${pkgname}/bin/idea.properties")
license=('Commercial')
depends=('java-environment')
makedepends=('clang')
_commit=8de8f3b9b08c4e27a9a92f5fb79308fbfb2e83d0

source=(
	"fsnotifier.h::http://git.jetbrains.org/?p=idea/community.git;a=blob_plain;f=native/fsNotifier/linux/fsnotifier.h;hb=$_commit" \
	"inotify.c::http://git.jetbrains.org/?p=idea/community.git;a=blob_plain;f=native/fsNotifier/linux/inotify.c;hb=$_commit" \
	"main.c::http://git.jetbrains.org/?p=idea/community.git;a=blob_plain;f=native/fsNotifier/linux/main.c;hb=$_commit" \
	"util.c::http://git.jetbrains.org/?p=idea/community.git;a=blob_plain;f=native/fsNotifier/linux/util.c;hb=$_commit" \
    idea.vmoptions        intellijidea.sh intellijidea.desktop intellijidea.install \
    "http://download.jetbrains.com/idea/ideaIU-${pkgver}.tar.gz")

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

  install -d -m755 $pkgdir/usr/{bin,share}

  cp -a "idea-IU-$pkgver" "$pkgdir/usr/share/$pkgname"
  sed -i 's|\.IntelliJIdea10|\.IntelliJIdeaXue|' "$pkgdir/usr/share/$pkgname/bin/idea.properties"

  cp "$srcdir"/idea.vmoptions "$pkgdir"/usr/share/$pkgname/bin
  cp "$srcdir"/$_fsnotifier "$pkgdir"/usr/share/$pkgname/bin/fsnotifier

  chmod +x $pkgdir/usr/share/$pkgname/bin/idea.sh
  chmod +x "$pkgdir"/usr/share/$pkgname/bin/fsnotifier

  if [ "$CARCH" = "i686" ]; then
    _rmpostfix="64"
  elif [ "$CARCH" = "x86_64" ]; then
    _rmpostfix=""
  fi
  rm $pkgdir/usr/share/intellij_idea_ue-x_eap/bin/\
{fsnotifier$_rmpostfix,libbreakgen$_rmpostfix.so,libyjpagent-linux$_rmpostfix.so}

  install -D -m755 $srcdir/intellijidea.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $srcdir/intellijidea.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/idea-IU-$pkgver/bin/idea.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -D -m644 $srcdir/idea-IU-$pkgver/license/IDEA_license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

md5sums=('703feffa16c7c8485935e5de795793a4'
         'b29ad6a43cd22400c7fa2e9304b112ee'
         'b22ff5c4bb99fd1b14d7da5f0f60e79b'
         'b5e338a0a6ae28763c7c246dd36c1b6a'
         'c51777b27eed5cca4d0406b3cf060406'
         '4751051e18f86959fd8c7d6f7d381c07'
         '0f08598c21d7f89c310116a99be9f963'
         '48130e94e6b816978f90b6f05b788ffc'
         '91fc114f4cde9015f25ba56455bda93e')
