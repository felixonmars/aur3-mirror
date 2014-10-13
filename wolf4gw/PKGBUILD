
# Maintainer: Jens Staal <staal1978@gmail.com>

# This is as much a demonstration of
# "how to use open watcom as cross compiler"
# as a fun game

pkgname=wolf4gw
pkgver=1
pkgrel=1
pkgdesc="Wolfenstein 3D built with 4GW extension (original DOS sources cross compiled to DOS with OpenWatcom)"
arch=('i686' 'x86_64')
url="http://virtuallyfun.superglobalmegacorp.com/?p=3118"
license=('unknown')
groups=('dos-games')
depends=('dosemu')
makedepends=('open_watcom-v2')
source=('http://www.brlowe.co.uk/WolfDX%20Source%20-%204GW%20version.zip' 'wolf4g.sh')
md5sums=('8eddd53c1045901426e1a6c54140a29a' 'c3515e6ac371611612c4cd6130434b74') #generate with 'makepkg -g'

prepare() {
	cd "$srcdir/"
	rm *.obj
}

build() {
	cd "$srcdir/"
	source /opt/watcom/owsetenv.sh
	export INCLUDE=$WATCOM/h
	export PATH=$WATCOM/binw:$PATH
	export LIBPATH=$WATCOM/binw:$LIBPATH
	#change to wolf4gw as defailt
	ide2make -p wolf.wpj
	sed 's|-mf -6r -d1 -w4 -e25 -zq|-mf -bt=dos -6r -d1 -w4 -e25 -zq -fo=.obj|g' -i WolfDX.mk1
	
	#change \n line breaks to a space
	sed ':a;N;$!ba;s/\n/ /g' -i *.{h,cpp}
	#fixing annoyances due to case insensitive filenames
	sed 's|BIOS.H|bios.h|g' -i *.cpp
	sed 's|DOS.H|dos.h|g' -i *.cpp
	cp -f foreign.h FOREIGN.H
	cp -f wl_menu.h WL_MENU.H
	cp -f GFXV_APO.H gfxv_apo.h
	cp -f wl_def.h WL_DEF.H
	
	wmake -f wolf.mk
}


package() {
	cd "$srcdir/"
	install -d $pkgdir/{opt/dos/games,usr/bin}
	install -m755 WolfDX.exe $pkgdir/opt/dos/games/
	install -m755 $srcdir/wolf4g.sh $pkgdir/usr/bin/wolf4g
}
