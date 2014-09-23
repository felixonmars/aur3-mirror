# Maintainer: Red Squirrel <iam at redsquirrel dot tk>
# Contributor: John Stebbins https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-snapshots/

pkgname=handbrake-beta
pkgver=0.10
pkgrel=6419
pkgdesc="Multithreaded video transcoder (pre-compiled builds of HandBrake SVN head)"
arch=('i686' 'x86_64')
url="http://handbrake.fr/"
license=("GPL")
install='handbrake.install'
depends=('bzip2' 'gcc-libs' 'gst-plugins-base' 'libnotify' 'dbus-glib'  'fribidi' 'libass' 'lame' 'gtk3' 'fontconfig' 'freetype2' 'libxml2' 'libogg' 'libvorbis' 'libtheora' 'libsamplerate' 'libbluray' 'libx264' 'desktop-file-utils' 'hicolor-icon-theme')
provides=('handbrake-cli' 'handbrake')
conflicts=('handbrake-cli' 'handbrake')
optdepends=('gst-plugins-good: for video previews' 'gst-libav: for video previews')
if [ $CARCH == 'x86_64' ]; then
  source=(
  "https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-snapshots/+files/handbrake-cli_${pkgrel}svnppa1~trusty1_amd64.deb"
  "https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-snapshots/+files/handbrake-gtk_${pkgrel}svnppa1~trusty1_amd64.deb"
  ) 
else
  source=(
  "https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-snapshots/+files/handbrake-cli_${pkgrel}svnppa1~trusty1_i386.deb"
  "https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-snapshots/+files/handbrake-gtk_${pkgrel}svnppa1~trusty1_i386.deb"
  )   
fi
md5sums=('SKIP' 'SKIP')

package() {
	cd $srcdir
	if [ $CARCH == 'x86_64' ]; then
		ar x handbrake-cli_${pkgrel}svnppa1~trusty1_amd64.deb && tar xvf data.tar.bz2
		ar x handbrake-gtk_${pkgrel}svnppa1~trusty1_amd64.deb && tar xvf data.tar.bz2	
	else
		ar x handbrake-cli_${pkgrel}svnppa1~trusty1_i386.deb && tar xvf data.tar.bz2
		ar x handbrake-gtk_${pkgrel}svnppa1~trusty1_i386.deb && tar xvf data.tar.bz2		
	fi	
	cp -R usr $pkgdir
}