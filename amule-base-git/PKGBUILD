# Maintainer: Gavin S <gav616(at)google mail(d0t)c0m>

pkgname=amule-base-git
pkgver=20100429
pkgrel=4
pkgdesc='An eMule-like P2P client, without wxGTK GUI dependencies'
arch=('i686' 'x86_64')
url="http://www.amule.org"
license=('GPL')
depends=('wxbase>=2.8.11' 'binutils' 'geoip')
makedepends=('git' 'crypto++' 'ccache')
conflicts=('amule' 'amule-adnza' 'amule-adnza-svn' 'amule-devel' \
           'amule-dlp' 'amule-remote' 'amule-remote-cvs' 'amule-remote-upnp' \
	   'amule-remote-upnp-svn' 'amule-upnp')
provides=('amule=2.2.6')
source=('amule.conf' 'amuled')
md5sums=('ff70a948f71ec7af26652dfcf6432e7d'
         '0e8f92cc39124ee3ce5cfc6708ab4373')
backup=('etc/conf.d/amule.conf')
install=amule.install
options=('!docs' 'ccache')

_gitroot=git://repo.or.cz/amule.git
_gitname=amule

build()
{
    msg
    msg "* Warning: The first build will gather all the source from the git repo..  *"
    msg "* ..this will create quite a large 'src' directory, 250 > 300 Megabytes.   *"
    msg "* If space in your '/var' directory is limited exit NOW ( Hold 'Ctrl' 'C') *"
    msg "* All builds after the intial build will only ever download updated files  *"
    msg "* CCache is also used to only ever build updated files from the git grab.  *"
    msg
    sleep 15
    
    msg
    msg "Connecting to the GIT server..."
    msg
    sleep 2
    
    cd $srcdir/
    if [[ -d $srcdir/$_gitname ]] ; then
        cd $_gitname
        git pull origin
    msg
    msg "The local files are updated..."
    msg
        sleep 2
    else
        git clone $_gitroot
    fi
    
    msg
    msg "GIT checkout done."
    msg
    sleep 2
    
    msg
    msg "Starting make for: $pkgname"
    msg
    sleep 2
    
    if [[ -d $srcdir/$_gitname-build ]]; then
       msg "Cleaning the previous build directory..." 
       rm -rf $srcdir/$_gitname-build
    fi

    git clone $srcdir/$_gitname $srcdir/$_gitname-build
    
    cd $srcdir/$_gitname-build
    
    msg  
    msg "Starting configure..."
    msg
    sleep 2

    ./configure --prefix=/usr \
	--disable-monolithic \
	--enable-amule-daemon \
	--enable-amulecmd \
	--enable-webserver \
	--disable-amule-gui \
	--disable-cas \
	--disable-wxcas \
	--disable-ed2k \
	--disable-alc \
	--disable-alcc \
	--disable-xas \
	--disable-plasmamule \
	--disable-kde-in-home \
	--enable-geoip \
	--disable-upnp \
	--disable-mmap \
	--disable-nls \
	--disable-debug \
	--enable-ccache \
	--with-toolkit=base || return 1

    make || return 1

    make DESTDIR=$pkgdir install || return 1
    
 install -D -m755 $startdir/amuled $pkgdir/etc/rc.d/amuled
 install -D -m644 $startdir/amule.conf $pkgdir/etc/conf.d/amule.conf

}
