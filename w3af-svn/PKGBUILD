# Contributor: MatToufoutu <mattoufootu[at]gmail.com>

pkgname=w3af-svn
pkgver=4334
pkgrel=1
pkgdesc="Web Application Attack and Audit Framework"
url="http://w3af.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2' 'python-fpconst' 'python2-nltk' 'python-soappy' 'python-pypdf' 'beautiful-soup' 'python2-pyopenssl' 'scapy' 'pysvn-py2' 'python-lxml')
makedepends=('subversion')
optdepends=(
        'python-pysqlite: Needed to run the GTK User Interface'
        'graphviz: Needed to run the GTK User Interface'
        'pygtk: Needed to run the GTK User Interface'
        'gtk2: Needed to run the GTK User Interface'
        'pygtksourceview2: Needed to run the GTK User Interface'
	    )
provides=('w3af')
options=('!strip')

source=('w3af_console.sh'
        'w3af_gui.sh')
md5sums=('6799fbdf3ffe36c117d323225c77d630'
         'e8dcfffd8f4d6e0242f2ec9170fd55e3')

_svntrunk=https://w3af.svn.sourceforge.net/svnroot/w3af/trunk
_svnmod=w3af

build() {
    if [ -d $srcdir/.svn ]; then
	msg2 'Getting latest SVN revision...'
	svn up $srcdir || (msg 'SVN update failed'; return 1)
	msg2 'SVN update successful'
    else
	msg2 'Checking out SVN...'
	svn co $_svntrunk $srcdir || (msg 'SVN checkout failed'; return 1)
	msg2 'SVN checkout successful'
    fi
}

package() {
    mkdir -p ${pkgdir}/{usr/bin,/opt/w3af}
    cp -r ${srcdir}/* ${pkgdir}/opt/w3af/
    install -m755 ${srcdir}/w3af_console.sh ${pkgdir}/usr/bin/w3af_console
    install -m755 ${srcdir}/w3af_gui.sh ${pkgdir}/usr/bin/w3af_gui
}

# vim: set ts=4 sw=4 ft=PKGBUILD :
