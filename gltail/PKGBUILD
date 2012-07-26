pkgname=gltail
pkgver=20120726
pkgrel=1
pkgdesc='Real-time visualization of server traffic, events and statistics with Ruby, SSH and OpenGL '
arch=('i686' 'x86_64')
url='https://github.com/Fudge/gltail'
license=('GPLv2')
install='gltail.install'
depends=('ruby1.8'  'rubygems1.8' 'freeglut')
makedepends=('git')

_gitroot='git://github.com/Fudge/gltail.git'
_gitname="$pkgname"

build() {
    cd $srcdir

    msg "Connecting to GIT server..."
    if [ -d "${_gitname}/.git" ]; then
        cd $_gitname && git pull origin
        msg "The local repository was updated."
    else
        git clone --depth 1 $_gitroot $_gitname
        cd $_gitname
        msg "The remote repository was cloned."
    fi

    install -d $pkgdir/usr/share/gltail $pkgdir/usr/bin $pkgdir/etc/gltail
    cp -r * $pkgdir/usr/share/gltail
    cp dist/config.yaml $pkgdir/etc/gltail/config.yaml

    sed -i $pkgdir/usr/share/gltail/bin/gl_tail \
        -e 's:#!/usr/bin/env .*:#!/usr/bin/env ruby-1.8:'
    cat > $pkgdir/usr/bin/gl_tail << EOF
#!/usr/bin/env bash
/usr/share/gltail/bin/gl_tail \$*
EOF
    chmod 755 $pkgdir/usr/bin/gl_tail
}
