# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: andy123 < andy123 AT online DOT de >

pkgname=fluxbox-styles
_pkgname=tenr.de-styles
pkgver=2
pkgrel=3
pkgdesc="Fluxbox styles/themes from tenr.de/styles/"
arch=('any')
url="http://tenr.de/styles/"
license=('CCPL')
depends=('fluxbox')
#source=("http://tenr.de/styles/archives/tenr.de-styles-pkg.tar.bz2")
source=("https://bitbucket.org/agalog/releases/downloads/tenr.de-styles-${pkgver}.tar.gz")
         #https://bitbucket.org/agalog/releases/downloads/tenr.de-styles.tar.gz 
md5sums=('a45b9be53d8d131a96425408e6b06762')

build () {
    cd "$srcdir/$_pkgname"
    if [[ -f "slim_blue/howtodeb.txt" ]]; then
	rm "slim_blue/howtodeb.txt"
    fi
    if [[ -d "darkclown/darkclown/" ]]; then
	if [[ -d "darkclown2/" ]]; then
	    rm -R -f "darkclown2/";
	fi
	cd "darkclown/"
	mv "darkclown/" "$srcdir/$_pkgname/darkclown2"
	cd "$srcdir/$_pkgname"
    fi
    if [[ -d "o_juice/o_juice/" ]]; then
	if [[ -d "o_juice2/" ]]; then
	    rm -R -f "o_juice2/";
	fi
	cd "o_juice/"
	mv "o_juice/" "$srcdir/$_pkgname/o_juice2"
	cd "$srcdir/$_pkgname"
    fi

}

package () {

    cd "$srcdir/$_pkgname"

    for dirs in $(ls -l1 | sed '/^[^d]/d ; s:.*\s:: ; /arch/d ; /bloe/d  ; /bora_[bg][lr][ae][ce][kn]/d ; /bora_blue/d ; /carp/d ; /green_tea/d ; /ostrich/d ; /zimek_bisque/d ; /zimek_green/d ; /zimek_darkblue/d')
    do
	# check for pixmaps 
	if [[ -d "${dirs}/pixmaps" ]]; then
	    for items in $(ls -1 "${dirs}/pixmaps" | sed '/png2xpm/d')
	    do
		install -m 644 -D "${dirs}/pixmaps/${items}" "$pkgdir/usr/share/fluxbox/styles/${dirs}/pixmaps/${items}"
	    done
	fi

	# check for wallpapers and backgrounds
	if  [[ -d "${dirs}/wallpaper" ]]; then
	    for picts in $(ls "${dirs}/wallpaper")
	    do
		install -m 644 -D "${dirs}/wallpaper/${picts}" "$pkgdir/usr/share/fluxbox/styles/${dirs}/wallpaper/${picts}"
	    done
		# checking for backgrounds. 
	elif [[ -d "${dirs}/bg" ]]; then
	    for bgs in $(ls "${dirs}/bg")
	    do
		install -m 644 -D "${dirs}/bg/${bgs}" "$pkgdir/usr/share/fluxbox/styles/${dirs}/bg/${bgs}"
	    done
	fi

	# install what's left.  
	for files in $(ls -1 "${dirs}" | sed '/pixmaps/d ; /wallpaper/d ; /bg/d')
	do
	    install -m 644 -D "${dirs}/${files}" "$pkgdir/usr/share/fluxbox/styles/${dirs}/${files}" 
	done
    done
}
	
