# 2008. 01. 31., 13.45.13 CET
# Maintainer: Charlos <hunarch@devall.hu>

pkgname=mplayer-hunarch
pkgver=1.0rc2
pkgrel=6
pkgdesc="A movie player for HUNArch Linux"
arch=('i686' 'x86_64')
depends=('faad2' 'libxxf86dga' 'libxv' 'libmad' 'libungif' 'cdparanoia' 'gtk2'
         'sdl' 'ladspa' 'lame' 'libcaca' 'libdca' 'libdv' 'libtheora' 'xvidcore'
         'libgl' 'smbclient' 'aalib' 'jack-audio-connection-kit' 'x264' 
		 'faac' 'lirc' 'lirc-utils' 'libdvdnav' 'libdvdread' 'lzo' 'libtheora'
		 'live-media' 'openal' 'speex')

license=('GPL')
url="http://www.mplayerhq.hu/"
makedepends=('libcaca' 'unzip' 'live-media' 'libdca' 'mesa' 'recode' 'samba')
backup=('etc/mplayer.conf' 'etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
provides=('mplayer')
conflicts=('mplayer')
install=('mplayer.install')
source=(ftp://ftp.mplayerhq.hu/MPlayer/releases/MPlayer-${pkgver}.tar.bz2
        ftp://ftp1.mplayerhq.hu/MPlayer/skins/Blue-1.7.tar.bz2
		ftp://ftp1.mplayerhq.hu/MPlayer/releases/fonts/font-arial-iso-8859-1.tar.bz2
		ftp://ftp1.mplayerhq.hu/MPlayer/releases/fonts/font-arial-iso-8859-2.tar.bz2
		mplayer.conf
		01-aalib-livemedia-gcc.patch
		02-linux_types_h.patch
		03-shut_up.patch
		04-desktop.patch
		i18n-06-hu-plusminus.patch)
#		MPlayer-1.0rc1-gnome-screensaver.patch)

build() {
  cd $startdir/src/MPlayer-${pkgver}

  # Custom CFLAGS break the mplayer build
  unset CFLAGS

  # Add support for gnome screensaver
  #patch -p1 -i ../MPlayer-1.0rc1-gnome-screensaver.patch || return 1
  
  cd $startdir/src/MPlayer-${pkgver}
  for i in ../*.patch; do
  msg "Applying for $i patch..."
  patch -p1 -i $i || return 1
  done
  
  find DOCS/HTML -mindepth 1 -maxdepth 1 ! -name en ! -name hu -print0 | xargs -0 rm -rf
  
  cd $startdir/src/MPlayer-${pkgver}/help
  msg "Converting translation files to UTF-8..."
  for locale in bg_BG cs_CZ de_DE da_DK el_GR en_US es_ES fr_FR hu_HU \
	  it_IT ja_JP ko_KR mk_MK nl_BE nb_NO pl_PL pt_BR ro_RO ru_RU sk_SK \
	  sv_SE tr_TR uk_UA zh_CN zh_TW; do
		lang="${locale%_*}"
		country="$(echo "${locale#*_}" | tr '[:upper:]' '[:lower:]')"
		if [ -f "help_mp-$locale.h" ]; then
			file="help_mp-$locale.h"
		elif [ -f "help_mp-$lang.h" ]; then
			file="help_mp-$lang.h"
		elif [ -f "help_mp-$country.h" ]; then
			file="help_mp-$country.h"
		else
			msg "translation for $locale not found" >&2
			exit 1
		fi
		if [ -f "$file.charset" ]; then
			charset="$(<$file.charset)"
		else
			charset="$(LC_ALL=$locale locale charmap)"
		fi
		if ! iconv -f UTF-8 -t UTF-8 <"$file" >/dev/null 2>&1; then
			iconv -f "$charset" -t UTF-8 <"$file" >"$file.tmp"
			touch --reference="$file" "$file.tmp"
			mv "$file.tmp" "$file"
		fi
	done
	for file in help_mp-*.h; do
		if ! iconv -f UTF-8 -t UTF-8 <"$file" >/dev/null 2>&1; then
			echo "$file is not valid UTF-8" >&2
			exit 1
		fi
	done
	msg "Translation files successfully converted to UTF-8"	  
	
  cd $startdir/src/MPlayer-${pkgver}/DOCS/man
  
  msg "Manual pages converting to UTF-8..."
  for i in de fr hu ; do  
  	  recode latin-2...utf-8 ${i}/mplayer.1 || return 1
  done
  cd $startdir/src/MPlayer-${pkgver}/
  
  ./configure \
	--prefix=/usr \
	--datadir=/usr/share/mplayer \
	--confdir=/etc/mplayer \
	--mandir=/usr/man \
	--codecsdir=/usr/lib/codecs \
	--win32codecsdir=/usr/lib/codecs \
	--enable-alsa \
	--enable-mencoder \
	--enable-largefiles \
	--enable-radio \
	--enable-radio-capture \
	--enable-dynamic-plugins \
	--enable-xvmc \
	--enable-pvr \
	--enable-menu \
	--enable-mmx \
	--enable-sse \
	--disable-termcap \
	--enable-gui \
	--enable-runtime-cpudetection \
	--language=hu \
	--disable-arts \
	--disable-ggi \
	--disable-svga \
	--disable-debug \
	--disable-fribidi \
	--with-extraincdir=/usr/lib/live-media

  [ "$CARCH" = "i686" ] &&  sed 's|-march=i486|-march=i686|g' -i config.mak
  make || return 1
  make -j1 DESTDIR=${startdir}/pkg install
  msg "Fixing man pages..."
  sed 's/ą/±/g' -i DOCS/man/hu/mplayer.1
  cp etc/{codecs.conf,input.conf,example.conf} ${startdir}/pkg/etc/mplayer/
  cp $startdir/src/mplayer.conf $startdir/pkg/etc/mplayer/mplayer.conf
  ln -s /usr/share/fonts/TTF/Vera.ttf ${startdir}/pkg/usr/share/mplayer/subfont.ttf
  rm -rf ${startdir}/pkg/usr/share/mplayer/font
  mv ${startdir}/src/Blue ${startdir}/pkg/usr/share/mplayer/skins/Blue
  ln -sf /usr/share/mplayer/skins/Blue ${startdir}/pkg/usr/share/mplayer/skins/default
  mkdir -p $startdir/pkg/usr/share/mplayer/fonts/
  mv $startdir/src/font-arial-iso-8859-1/* $startdir/pkg/usr/share/mplayer/fonts/
  mv $startdir/src/font-arial-iso-8859-2/* $startdir/pkg/usr/share/mplayer/fonts/
  ln -sf /usr/share/mplayer/fonts/font-arial-iso-8859-2/font-arial-24-iso-8859-2 $startdir/pkg/usr/share/mplayer/font
  }

md5sums=('7e27e535c2d267637df34898f1b91707'
         'e4e2020d11b681aac898103b3ba723c4'
         '1ecd31d17b51f16332b1fcc7da36b312'
         '7b47904a925cf58ea546ca15f3df160c'
         '7a670abd6d9d018ec0e7b6b37587a833'
         '1410ffec2070d2e9eb984e807fa247a6'
         '17826bad3c6f16a8274dda3ebf7849eb'
         '8169cab18533591828fce90e91502eb0'
         'd83f51d63453df75089edc2192408cea'
         'ee473071784fddcfec826db5f9b29bad')
sha1sums=('e9b496f3527c552004ec6d01d6b43f196b43ce2d'
          '45e5ee7a5541a5f1cfd2678a6c9b5911ca473cb9'
          '152c40bf20de34aa8802d7f80d34d673b0b67212'
          '7b99bbe0e9ba89a57eccbea8f93c453c4f268181'
          'ba7dde053d522bce83283116b0d2793dc03ebfcb'
          '8f7923aad5d158a7f0af8e6ca3188786d8055c34'
          '9514004f5ea9220061cbd7c941c22af1beceba4e'
          '0f1078dfe426b98ed5912c12119d9b1b21af79c1'
          'a230b33a134dad9d91815ea524efd12b0cd3441a'
          '3fd2724ff02a84ae51c8ca44f705425e84d65271')
