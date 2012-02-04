#Maintainer: Marcus Ekwall (mekwall) <marcus.ekwall@gmail.com>
#Based on pkgbuilds by DarkJesus <priestoftime@gmail.com> and Pablo Escobar <pablo__escobar@tlen.pl>

pkgname=gmpc-plugins-git
provides='gmpc-plugins'
conflicts=('gmpc-plugins'
           'gmpc-alarm'
           'gmpc-alarm-git'
           'gmpc-albumview'
           'gmpc-albumview-git'
           'gmpc-avahi'
           'gmpc-avahi-git'
           'gmpc-coveramazon'
           'gmpc-coveramazon-git'
           'gmpc-extraplaylist'
           'gmpc-extraplaylist-git'
           'gmpc-guitartabs'
           'gmpc-guitartabs-git'
           'gmpc-last.fm'
           'gmpc-last.fm-git'
           'gmpc-lastfmradio'
           'gmpc-lastfmradio-git'
           'gmpc-libnotify'
           'gmpc-libnotify-git'
           'gmpc-lirc'
           'gmpc-lirc-git'
           'gmpc-lyrdb'
           'gmpc-lyrdb-git'
           'gmpc-lyrics'
           'gmpc-lyrics-git'
           'gmpc-lyricwiki'
           'gmpc-lyricwiki-git'
           'gmpc-mdcover'
           'gmpc-mdcover-git'
           'gmpc-osd'
           'gmpc-osd-git'
           'gmpc-playlistsort'
           'gmpc-playlistsort-git'
           'gmpc-qosd'
           'gmpc-qosd-git'
           'gmpc-shout'
           'gmpc-shout-git'
           'gmpc-tagedit'
           'gmpc-tagedit-git')
pkgver=20091111
pkgrel=1
pkgdesc='This package fetches all gmpc plugins from GIT'
url='http://repo.or.cz/w/gmpc-plugins.git'
license='GPL'
arch=('i686' 'x86_64')
depends=('gmpc-git' 'libmpd-git' 'libxml2' 'gtk2' 'cairo' 'libnotify' 'avahi' 'xosd' 'lirc')
makedepends=('gob2' 'automake>=1.7' 'git' 'xosd' 'pkgconfig')
options=('!libtool')
source=()
md5sums=()

_gitroot='git://repo.or.cz/'
_gitpkgs=('gmpc-alarm'
          'gmpc-albumview'
          'gmpc-avahi'
          'gmpc-coveramazon'
          #'gmpc-extraplaylist' # Broken as of 2009-10-19 - requesting gmpc >= 0.19.2
          #'gmpc-guitartabs'    # Broken as of 2009-10-19
          #'gmpc-jamendo'        # Broken as of 2009-07-17
          'gmpc-last.fm'
          #'gmpc-lastfmradio'    # Broken as of 2009-11-11
          'gmpc-libnotify'
          'gmpc-lirc'           # Extra deps: lirc
          'gmpc-lyrdb'
          'gmpc-lyrics'
          'gmpc-lyricwiki'
          #'gmpc-magnatune'      # Broken as of 2009-11-11
          'gmpc-mdcover'
          #'gmpc-mserver'       # Extra deps: libmicrohttpd (only available through aur atm.)
          'gmpc-osd'
          'gmpc-playlistsort'
          #'gmpc-qosd'          # Broken as of 2009-11-11
          #'gmpc-serverstats'   # Obsolete: built into gmpc
          'gmpc-shout'
          'gmpc-tagedit')
build() {
	cd $startdir/src

	for gitpkg in "${_gitpkgs[@]}"; do

		msg "\n**************************\n Plugin: ${gitpkg} \n**************************"
		msg "Cloning/updating GIT repository from ${_gitroot}${gitpkg}.git..."

		if [ -d $startdir/src/$gitpkg ] ; then
			cd $gitpkg && git pull origin
		else
			git clone $_gitroot$gitpkg.git $startdir/src/$gitpkg
		fi

		msg "GIT clone/update done or server timed out."

		msg "Starting make..."

		cp -r $startdir/src/$gitpkg $startdir/src/$gitpkg-build
		cd $startdir/src/$gitpkg-build

		./autogen.sh --prefix=/usr
		make || return 1
		make DESTDIR=$startdir/pkg install

		find $startdir/pkg -type f -name "*.la" -exec rm {} \;
	done
}
