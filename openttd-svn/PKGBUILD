# Contributor: Snorre Jensen <snojen@gmail.com>
# Original submitter: Sacro <ben at benwoodward dot me dot uk>
#################################################################################################

# Check out the current nightly? change this to yes 
#_NIGHTLY=no      # yes/no

# Use ~/.openttd dir same as stable version (if no, personalconfig = .openttd-svn)
_org_config=yes  # yes/no  

# set yes here for those opdepends packages you have or plan to install
# this will generate symlinks from /usr/share/openttd/data to /usr/share/opentt-beta
# Set to no if you run a dedicated server and dont have optdepends installed
_opengfx=yes	# yes/no	
_opensfx=yes	# yes/no
_openmsx=no	# yes/no

#################################################################################################

pkgname=openttd-svn
pkgver=25000
pkgrel=1
pkgdesc="open source simulation game based upon Transport Tycoon Deluxe"
arch=('i686' 'x86_64')
url="http://www.openttd.org"
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo2' 'hicolor-icon-theme' 'desktop-file-utils' 'xz')
makedepends=('subversion')
optdepends=('openttd-opengfx: free graphics' 
            'openttd-opensfx: free soundset'
            'openttd-openmsx: free musicset')
_svnmod=trunk
source=("$_svnmod::svn://svn.openttd.org/$_svnmod")
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/$_svnmod"
  svnversion
}

#if [ $_NIGHTLY = yes ]; then
#	_nigtlyversion=`wget -q http://finger.openttd.org/versions.txt -O - | grep -E 'nightlies/trunk' | egrep -o '^r([0-9]+)' | sed 's/r//'`
#	if [ -z $_nigtlyversion ]; then
#		echo "Error checking version information from finger.openttd.org"
#		exit
#	else 
#		pkgver=$_nigtlyversion
#	fi
#fi


if [ $_org_config = yes ]; then
	_personaldir=.openttd
else
	_personaldir=.${pkgname}
fi



build() {
	cd $srcdir/$_svnmod
	./configure \
	--prefix-dir=/usr \
	--binary-name=openttd-svn \
	--binary-dir=bin \
	--data-dir=share/openttd-svn \
	--install-dir=$pkgdir \
	--doc-dir=share/doc/openttd-svn \
	--menu-name="OpenTTD SVN r${pkgver}" \
	--personal-dir=${_personaldir}

	make || return 1

}


package() {
	cd $srcdir/$_svnmod
	make install || return 1

if [ $_opengfx = yes ]; then
   mkdir $pkgdir/usr/share/${pkgname}/data
   cd $pkgdir/usr/share/${pkgname}/data
   ln -s /usr/share/openttd/data/ogfx1_base.grf .
   ln -s /usr/share/openttd/data/ogfxc_arctic.grf .
   ln -s /usr/share/openttd/data/ogfxe_extra.grf .
   ln -s /usr/share/openttd/data/ogfxh_tropical.grf .
   ln -s /usr/share/openttd/data/ogfxi_logos.grf .
   ln -s /usr/share/openttd/data/ogfxt_toyland.grf .
fi

if [ $_opensfx = yes ]; then
   ln -s /usr/share/openttd/data/opengfx.obg .
   ln -s /usr/share/openttd/data/opensfx.cat .
   ln -s /usr/share/openttd/data/opensfx.obs .
fi

if [ $_openmsx = yes ]; then
   mkdir $pkgdir/usr/share/${pkgname}/gm
   cd $pkgdir/usr/share/${pkgname}/gm
   ln -s /usr/share/openttd/gm/5432gone_redfarn.mid .
   ln -s /usr/share/openttd/gm/be_sharp_bw_redfarn.mid .
   ln -s /usr/share/openttd/gm/big_man_boogie_redfarn.mid .
   ln -s /usr/share/openttd/gm/boogi_marabi_redfarn.mid .
   ln -s /usr/share/openttd/gm/busy_schedule.mid .
   ln -s /usr/share/openttd/gm/careless_perc_redfarn.mid .
   ln -s /usr/share/openttd/gm/chemistry_lab.mid .
   ln -s /usr/share/openttd/gm/chuggachugga.mid .
   ln -s /usr/share/openttd/gm/city_blues_redfarn.mid .
   ln -s /usr/share/openttd/gm/coconut_run2.mid .
   ln -s /usr/share/openttd/gm/flying_scotsman.mid .
   ln -s /usr/share/openttd/gm/harp_harmony.mid .
   ln -s /usr/share/openttd/gm/linns_basket.mid .
   ln -s /usr/share/openttd/gm/midnight_snow_run.mid .
   ln -s /usr/share/openttd/gm/mighty_giant_run.mid .
   ln -s /usr/share/openttd/gm/modern_motion.mid .
   ln -s /usr/share/openttd/gm/moo_redfarn.mid .
   ln -s /usr/share/openttd/gm/mosey_along_redfarn.mid .
   ln -s /usr/share/openttd/gm/no_work_song_redfarn.mid .
   ln -s /usr/share/openttd/gm/openmsx.obm .
   ln -s /usr/share/openttd/gm/relax_song.mid .
   ln -s /usr/share/openttd/gm/run_for_your_life.mid .
   ln -s /usr/share/openttd/gm/say_what_redfarn.mid .
   ln -s /usr/share/openttd/gm/slow_neasy_redfarn.mid .
   ln -s /usr/share/openttd/gm/the_fast_route.mid .
   ln -s /usr/share/openttd/gm/the_hobo_redfarn.mid .
   ln -s /usr/share/openttd/gm/train_filled_with_cash.mid .
   ln -s /usr/share/openttd/gm/ttsong_iii_imuh3.mid .
   ln -s /usr/share/openttd/gm/ttsong_iv_imuh3.mid .
   ln -s /usr/share/openttd/gm/tttheme2.mid .
   ln -s /usr/share/openttd/gm/ultimate_run.mid .
   ln -s /usr/share/openttd/gm/wood_whistles.mid .
fi


}
