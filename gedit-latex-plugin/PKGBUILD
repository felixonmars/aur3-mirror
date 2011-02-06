# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname="gedit-latex-plugin"
pkgver=0.2
pkgrel=3
pkgdesc="Latex Plugin for Gedit"
url="http://live.gnome.org/Gedit/LaTeXPlugin"
license=("GPL")
arch=('i686' 'x86_64')
depends=('gedit' 'rubber' 'dbus-python' 'python-poppler')
optdepends=('python-pyenchant: spellcheck')
install="$pkgname.install"
source=("http://downloads.sf.net/gedit-latex/LaTeXPlugin-${pkgver}.tar.gz")

build() {
    # adjust default texmf path to arch's texlive path
    sed -i "s#/usr/share/texmf-texlive#/usr/share/texmf-dist#g" $startdir/src/GeditLaTeXPlugin/src/latex/environment.py
    # move src out of subdir
    mv $startdir/src/GeditLaTeXPlugin/src/* $startdir/src/GeditLaTeXPlugin
    # because we move src, adjust the path mentioned in the plugin meta file
    sed -i "s#Module=GeditLaTeXPlugin/src#Module=GeditLaTeXPlugin#g" $startdir/src/GeditLaTeXPlugin.gedit-plugin
    # create target dir
    install -dm 755 $startdir/pkg/usr/lib/gedit-2/plugins
    # copy plugin meta file
    install -m 644  $startdir/src/GeditLaTeXPlugin.gedit-plugin $startdir/pkg/usr/lib/gedit-2/plugins
    # copy everything else to target dir
    cp -r $startdir/src/GeditLaTeXPlugin $startdir/pkg/usr/lib/gedit-2/plugins
}
md5sums=('714bbe2c24337a8a8ea3e444a5d729fc')
