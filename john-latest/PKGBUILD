#Contributor: MatToufoutu <mattoufootu[at]gmail[dot]com>

pkgname=john-latest
pkgver=1.7.6
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc='JohnTheRipper password cracker with Jumbo patch'
url='http://openwall.info'
license=('GPL')

source=("http://www.openwall.com/john/g/john-${pkgver}.tar.gz"
        "http://www.openwall.com/john/contrib/john-${pkgver}-jumbo-2.diff.gz"
        "params.h.patch")
md5sums=('ce1dffc6e347906205d14c4d6a210491'
         '758e2bad31d49f97f8d6c1bfa70d6da5'
         'f69ed632eba8fb9e45847a4b4a323787')

build() {
    cd ${srcdir}/john-${pkgver}/

    msg "Applying patches..."
    (gzip -dc ${srcdir}/john-${pkgver}-jumbo-2.diff.gz | patch -p1) || return 1
    cd src/
    patch -p0 < ${srcdir}/params.h.patch || return 1

    msg "Starting build..."
    if [ "$CARCH" == "x86_64" ]; then
        make linux-x86-64 || return 1
    else
        make linux-x86-sse2 || return 1
    fi

    msg "Installing files..."
    cd ..

    #config file
    msg2 "Configuration file"
    install -d ${pkgdir}/etc/john/
    sed -i 's|$JOHN|/usr/share/john|g' run/john.conf || return 1
    install -m644 run/john.conf ${pkgdir}/etc/john/john.conf || return 1

    #docs
    msg2 "Documentation"
    install -d ${pkgdir}/usr/share/doc/john/
    install -m644 doc/* ${pkgdir}/usr/share/doc/john/ || return 1

    #wordlists, charset and stats files
    msg2 "Wordlists, charset and stats files"
    install -d ${pkgdir}/usr/share/john/
    install -m644 run/{{all,alnum,alpha,digits,lanman}.chr,password.lst,stats} ${pkgdir}/usr/share/john/ || return 1

    #binaries
    msg2 "John binaries"
    install -d ${pkgdir}/usr/bin/
    install -m755 run/john ${pkgdir}/usr/bin/john || return 1
    install -m755 run/mailer ${pkgdir}/usr/bin/john-mailer || return 1
    install -m755 run/netntlm.pl ${pkgdir}/usr/bin/john-netntlm || return 1
    install -m755 run/sap_prepare.pl ${pkgdir}/usr/bin/john-sap_prepare || return 1
    install -m755 run/sha-dump.pl ${pkgdir}/usr/bin/john-ldap-dump || return 1
    install -m755 run/netscreen.py ${pkgdir}/usr/bin/john-netscreen || return 1
    install -m755 run/genincstats.rb ${pkgdir}/usr/bin/john-genincstats || return 1

    #additional binaries
    msg2 "Additional binaries"
    install -d ${pkgdir}/usr/sbin/
    install -m755 run/genmkvpwd ${pkgdir}/usr/sbin/genmkvpwd || return 1
    install -m755 run/calc_stat ${pkgdir}/usr/sbin/calc_stat || return 1
    install -m755 run/mkvcalcproba ${pkgdir}/usr/sbin/mkvcalcproba || return 1
    install -m755 run/tgtsnarf ${pkgdir}/usr/sbin/tgtsnarf || return 1
    
    #symlinks
    msg2 "Symlinks"
    cd ${pkgdir}/usr/bin/
    ln -s john unafs
    ln -s john unique
    ln -s john unshadow
    ln -s john undrop
}

