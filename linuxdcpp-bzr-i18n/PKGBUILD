# Contributor : 3ED <krzysztof1987@gmail.com>
# based pkgbuild fancris3 and nemOn(YarLUG)

pkgname=linuxdcpp-bzr-i18n
pkgver=287
# tested at 287; if now not work, use --holdver
pkgrel=1
pkgdesc="Linux dc++ 1.0.2+core0707+i18n (multilanguages)"
url="https://launchpad.net/linuxdcpp"
license="GPL"
arch=('i686' 'x86_64')
depends=('libglade' 'bzip2' 'gettext')
makedepends=('scons' 'bzr' 'gcc' 'pkgconfig' 'boost')
conflicts=('linuxdcpp' 'linuxdcpp-cvs' 'linuxdcpp-bzr')

_bzrtrunk=https://code.launchpad.net/~individ/linuxdcpp/i18n
_bzrmod=i18n

build() {
  cd "$srcdir"

  msg "Connecting to linuxdcpp bzr server...."

  if [ -d "$srcdir/$_bzrmod" ] ; then
  cd "$_bzrmod" && bzr up
  msg "The local files are updated."
  else
  bzr branch $_bzrtrunk
  fi
    
  msg "bzr checkout done or server timeout"
  msg "Starting make..."

  rm -r "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$startdir/src/$_bzrmod-build"
	cd "$srcdir/$_bzrmod-build/"
	tar -xf "$srcdir/dcpp-win32-po.tar.gz"

	# compile i18n
	cd "$srcdir/$_bzrmod-build/dcpp/po/"
	cp "$srcdir/i18n.better.sh" "$srcdir/$_bzrmod-build/i18n.better.sh"
	cp "$srcdir/libdcpp.pl.po" "$srcdir/$_bzrmod-build/dcpp/po/pl.po"
	mkdir "$srcdir/$_bzrmod-build/linux/po"
	for i in *.po; do
		if [ "$i" = '*.po' ]; then break; fi
		sh "$srcdir/$_bzrmod-build/i18n.better.sh" "${i%%.po}" "win32/po/$i"
	done

	# better linuxdcpp.pl.po
	msgmerge "$srcdir/linuxdcpp.pl.po" "$srcdir/$_bzrmod-build/linux/po/linuxdcpp.pot" > "$srcdir/$_bzrmod-build/pl.po"
	msgfmt -c "$srcdir/$_bzrmod-build/pl.po" -o "$srcdir/$_bzrmod-build/locale/pl/LC_MESSAGES/linuxdcpp.mo"

	# compile and install program
	cd "$srcdir/$_bzrmod-build"
  scons PREFIX=/usr LIBDIR=/usr/share || return 1
  scons install FAKE_ROOT="$pkgdir" || return 1
  
	# install desktop and pixmap
  install -D "$srcdir/linuxdcpp.desktop" "$pkgdir/usr/share/applications/linuxdcpp.desktop"
  install -D "$srcdir/$_bzrmod-build/pixmaps/linuxdcpp.png" "$pkgdir/usr/share/pixmaps/linuxdcpp.png"

	# install locales
	cp -r "$srcdir/$_bzrmod-build/locale" "$pkgdir/usr/share/"

	# cleaning source
  rm -r "$startdir/src/$_bzrmod-build"
}
#$cat=network
