# Maintainer: Michael Weichert <mweichert@gmail.com>
pkgname=membase-server-community
pkgver=1.6.5.3
pkgrel=1
pkgdesc="Memcached-compatible distributed, key-value database management system optimized for storing data behind interactive web applications"
url="http://www.membase.org"
arch=("x86_64")
license=("APACHE")
depends=("erlang" "python2" "libevent" "curl" "pkgextract")
conflicts=("memcached")
source=('http://mweichert.com/arch/$pkgname-$pkgver/membase-server')
_source_pkg=("http://packages.couchbase.com/releases/1.6.5.3/${pkgname}_${arch}_${pkgver}.deb")
md5sums=("779c468a925fc0618fab414e5548903a")

build() {
	cd "${srcdir}"
	pkgfilename="${pkgname}_${arch}_${pkgver}.deb"

	# Download the package. We need to use cURL to set the HTTP Referer as
	# couchbase.com doesn't allow direct access for some reason
  	curl -e "http://www.couchbase.com/downloads/membase-server/community" -o $pkgfilename $_source_pkg

	# As this is a debian pkg, we need to extract it
	pkgextract.sh $pkgfilename

	# Convert all python scripts to use python2
	for python_file in `grep -r '#!/usr/bin/env python' opt/membase/bin/cli | cut -f 1 -d ':'`; do
	  sed 's,#!/usr/bin/env python,#!/usr/bin/env python2,' $python_file | cat > $python_file
	done

	# Install each directory provided by the debian package
	for dir in etc usr var opt; do
  	  for src in `find ${dir}`; do
	    perm="775"

	    # Binary files need to be executable
	    if [ "`echo ${src} | grep -o bin | wc -l`" -eq "0" ]; then
	      perm="644"
	    fi
	    dst="$pkgdir/$src"
	    
	    if [ $src == "etc/init.d/membase-server" ]; then
		mkdir -p $pkgdir/etc/rc.d
		install -m755 membase-server "$pkgdir/etc/rc.d/membase-server"
	    elif [ $src == "etc/init.d" ]; then
		continue
	    elif [ -h $src ]; then
	   	cp -rl $src $dst
	    elif [ -d $src ]; then
		install -dm755 $src $dst
	    else
		install -m${perm} $src $dst		
	    fi
	  done
	done

	# Install a wrapper for membase
	wrapper="$pkgdir/opt/membase/bin/membase_wrapper"
	touch $wrapper
	chmod a+x $wrapper
	echo '#!/bin/bash' >>$wrapper
	echo 'ulimit -n 10240' >>$wrapper
    	echo 'ulimit -c unlimited' >>$wrapper
	echo '/opt/membase/bin/membase' >>$wrapper

	# 
}
