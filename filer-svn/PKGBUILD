# Contributor : Priyank M.G. <priyankmg@gmail.com>

pkgname=filer-svn        
pkgver=157
pkgrel=1
pkgdesc="Filer is a  small, fast and efficient file-manager written in Perl using Gtk2"
url="http://blog.perldude.de/projects/filer/"
depends=('gtk2' 'perl' 'gtk2-perl' 'perl-extutils-depends' 'perl-extutils-pkgconfig' 'perl-file-mimeinfo' 'perl-file-basedir' 'perl-stat-lsmode' 'perl-yaml' 'perl-file-dirwalk' 'perl-readonly' 'perl-class-std-utils' 'perl-cpan-version')
conflicts=('filer')
provides=('filer')
source=()
md5sums=()

_svnmod=filer-svn
_svntrunk=http://svn.foo-projects.org/svn/filer/trunk 

build() {

  cd $startdir/src
  touch ~/.subversion
  svn co $_svntrunk --config-dir ./ $pkgname filer-svn $pkgver
  cd $pkgver/trunk
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  make install PREFIX=$startdir/pkg/usr
}
