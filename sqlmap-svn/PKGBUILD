pkgname=sqlmap-svn
pkgver=5024
pkgrel=2
pkgdesc="Automatic SQL injection and database takeover tool"
arch=('any')
url='http://sqlmap.sourceforge.net'
license=('GPLv2')
makedepends=('svn')
depends=('python2')
provide=('sqlmap')
options=('!strip')
source=()

_svntrunk="https://svn.sqlmap.org/sqlmap/trunk/sqlmap"
_svnmod="sqlmap"

build(){
    cd "$srcdir"
    
    if [ -d $_svnmod ]; then
        msg "Updating existing src..."
        ( cd $_svnmod && svn up -r $pkgver )
    else
        msg "Checkout src..."
        svn co $_svntrunk $_svnmod -r $pkgver
    fi

    cp -rf $_svnmod $_svnmod-build

}

package(){
    cd "$srcdir"
    msg "Cleaning up..."
    rm -rf "$_svnmod-build/.svn"

    msg "Copy files" 

    # Make executable in /usr/bin
    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/sqlmap" << EOF
#!/bin/bash
cd /opt/sqlmap
python2 sqlmap.py \$@
cd \$OLDPWD
EOF
    chmod 755 "$pkgdir/usr/bin/sqlmap"
    
    # Copy files over
    mkdir -p "$pkgdir/opt"
    mv $_svnmod-build "$pkgdir/opt/sqlmap"
}

