# Maintainer: Robert Kieffer <rek2w @ A L U M N I DOT V I R G I N I A DOT E D U>
# Based on pkgbuild by Rudy Matela <rudy.matela@gmail.com>
# Date: 2010-1-18 

# compile options

# If you want to build the beta (2.2_1) instead of the stable (2.2_0), 
# change elvis source and MD5 to:
# "ftp://ftp.cs.pdx.edu/pub/elvis/unreleased/almost-2.2_1.tar.gz"
# "6959f2f156920db47e4c6324f187e632"
# and pkgver="2.2_1"

_COMPILEWX11=true 		# X11 support built by default
_SLACKWARECOLORS=false 	# elvis colorscheme from slackware not installed by default - it's boring


pkgname=elvis_patched-withx
pkgver=2.2_0
pkgrel=1
url="http://elvis.the-little-red-haired-girl.org/"
alt_url="http://elvis.vi-editor.org/"
pkgdesc="A vi clone - with X support (if you wish) - stable or beta version"
depends=('glibc' 'libx11' 'ncurses' 'fontconfig' 'expat' 'freetype2' 'zlib')
source=("ftp://ftp.cs.pdx.edu/pub/elvis/elvis-2.2_0.tar.gz"
	"http://cvsweb.netbsd.org/bsdweb.cgi/~checkout~/pkgsrc/editors/elvis/patches/patch-ref.c"
	"http://cvsweb.netbsd.org/bsdweb.cgi/~checkout~/pkgsrc/editors/elvis/patches/patch-ae"
	"ftp://ftp.slackware.com/pub/slackware/slackware-13.0/source/a/elvis/elvis.clr")
md5sums=('6831b8df3e4a530395e66c2889783752'
         '8d9df9aa5edcf8e0b8a2f5d59d1c30c7'
         '2bec41d9f09542e2ef41de1e6b41727e'
         'c47a70cb176ebf2eb99b055c4048a560')
arch=('i686' 'x86_64')
license=('PerlArtistic')
conflicts=('elvis' 'elvis_slack')
replaces=('elvis' 'elvis_slack')

_DESKTOPFILE="[Desktop Entry]\\nType=Application\\nVersion=1.0\\nName=Elvis\\nComment=A simple text editor\\nExec=elvis\\nIcon=$pkgname\\nTerminal=true\\nCategories=Editors;Programming;Accessories"

build() { 
	cd $srcdir/elvis-$pkgver
	if [ $_COMPILEWX11 = "true" ]	
	then
		_X11OPT=" --with-x"
		_COMPILEWX11=1
	else 
		_X11OPT=" --with-x=no"
		_COMPILEWX11=0
	fi
	if [ $_SLACKWARECOLORS = "true" ]
		then cp $srcdir/elvis.clr ./data
	fi
  cat $srcdir/patch-* > patches
  patch -p0 <patches
  echo -e $_DESKTOPFILE > $pkgname.desktop
  ./configure --prefix=/usr --verbose $_X11OPT
  sed 's/\<CTAGS\>/ELVTAGS/g; s/ctags\>/elvtags/g; s/ant" elvtags/ant" ctags/' doc/ctags.man >doc/elvtags.man
  /usr/bin/make || return 1
  
	install -d $pkgdir/usr/bin $pkgdir/usr/share/elvis/ $pkgdir/usr/share/man/man1/
  for i in elvis ref elvtags elvfmt; do
      install -D -s -m755 $i $pkgdir/usr/bin/
  done

  cd $srcdir/elvis-$pkgver/data/
  cp -r *  $pkgdir/usr/share/elvis/
  
  cd $srcdir/elvis-$pkgver/doc/
  install -D -m644 *.html bugs.txt $pkgdir/usr/share/elvis/
  for i in elvis ref elvtags elvfmt; do
      mv $i.man $i.1
      gzip $i.1
      install -D -m644 $i.1.gz $pkgdir/usr/share/man/man1/
  done
  
  if (( $_COMPILEWX11 ))	
	then
	install -D -m644 $srcdir/elvis-$pkgver/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -D -m644 $srcdir/elvis-$pkgver/data/icons/elvis3.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
  fi
}
